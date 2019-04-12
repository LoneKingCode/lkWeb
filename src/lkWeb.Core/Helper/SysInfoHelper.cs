using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Microsoft.Extensions.PlatformAbstractions;

namespace lkWeb.Core.Helper
{
    public class ServerInfo
    {
        public string MachineName { get; set; }
        public string CurrentDirectory { get; set; }
        public string OsVersionString { get; set; }
        public string ServerIp { get; set; }
        public string ServerUrl { get; set; }
        public int? ServerPort { get; set; }
        public string RuntimeFramework { get; set; }
        public string LoggedUserName { get; set; }
        public string CpuUsed { get; set; }
        public string MemoryUsed { get; set; }
        public string MemoryAvailable { get; set; }
        public string DiskRead { get; set; }
        public string DiskWrite { get; set; }
        public string DiskReadWrite { get; set; }
        public IList<DiskInfo> Disks { get; set; }
        public IList<NetworkInfo> Networks { get; set; }

    }

    public class NetworkInfo
    {
        public string Name { get; set; }
        public string Sent { get; set; }
        public string Received { get; set; }

    }

    public class DiskInfo
    {
        public string Name { get; set; }
        public string TotalSpace { get; set; }
        /// <summary>
        /// 可用空间(数字)
        /// </summary>
        public string FreeSpaceN { get; set; }
        public string UsedSpaceN { get; set; }
        /// <summary>
        /// 可用空间 百分比
        /// </summary>
        public string FreeSpace { get; set; }
        public string UsedSpace { get; set; }
        public string DiskRead { get; set; }
        public string DiskWrite { get; set; }
        public string DiskReadWrite { get; set; }
    }

    public class SysInfoHelper
    {
        static PerformanceCounter cpuCounter = new PerformanceCounter("Processor", "% Processor Time", "_Total");
        static PerformanceCounter diskReadCounter = new PerformanceCounter("LogicalDisk", "Disk Read Bytes/sec", "_Total");
        static PerformanceCounter diskWriteCounter = new PerformanceCounter("LogicalDisk", "Disk Write Bytes/sec", "_Total");
        static PerformanceCounter diskReadWriteCounter = new PerformanceCounter("LogicalDisk", "Disk Bytes/sec", "_Total");
        static PerformanceCounter memoryUsedCounter = new PerformanceCounter("Memory", "% Committed Bytes In Use");
        static PerformanceCounter memoryAvaliableCounter = new PerformanceCounter("Memory", "Available Bytes");
        static Dictionary<string, PerformanceCounter> diskCounters = new Dictionary<string, PerformanceCounter>();
        static Dictionary<string, PerformanceCounter> networkCounters = new Dictionary<string, PerformanceCounter>();

        public static ServerInfo GetServerInfo()
        {
            ServerInfo info = new ServerInfo();
            info.MachineName = System.Environment.MachineName;
            info.CurrentDirectory = System.Environment.CurrentDirectory;
            info.OsVersionString = System.Environment.OSVersion.VersionString + " "
                + (System.Environment.Is64BitOperatingSystem ? "X64" : "X86");
            info.ServerIp = WebHelper._httpContext.Connection.LocalIpAddress.MapToIPv4().ToString();
            info.ServerUrl = WebHelper._httpContext.Request.Host.Host;
            info.ServerPort = WebHelper._httpContext.Request.Host.Port;
            info.RuntimeFramework = PlatformServices.Default.Application.RuntimeFramework.FullName;
            info.LoggedUserName = System.Environment.UserName;

            info.CpuUsed = Math.Round(cpuCounter.NextValue(), 2, MidpointRounding.AwayFromZero).ToString();
            info.DiskRead = diskReadCounter.NextValue().ToString();
            info.DiskWrite = diskWriteCounter.NextValue().ToString();
            info.DiskReadWrite = diskReadWriteCounter.NextValue().ToString();
            info.MemoryUsed = Math.Round(memoryUsedCounter.NextValue(), 2, MidpointRounding.AwayFromZero).ToString();
            info.MemoryAvailable = memoryAvaliableCounter.NextValue().ToString();
            info.Disks = GetDiskInfo();
            info.Networks = GetNetworkInfo();
            return info;
        }
        public static IList<NetworkInfo> GetNetworkInfo()
        {
            var result = new List<NetworkInfo>();
            PerformanceCounterCategory category = new PerformanceCounterCategory("Network Interface");
            String[] instanceNames = category.GetInstanceNames();
            foreach (var instance in instanceNames)
            {
                if (instance == "_Total")
                    continue;
                if (!networkCounters.ContainsKey(instance + "_sent"))
                    networkCounters.Add(instance + "_sent", new PerformanceCounter("Network Interface", "Bytes Sent/sec", instance));
                if (!networkCounters.ContainsKey(instance + "_received"))
                    networkCounters.Add(instance + "_received", new PerformanceCounter("Network Interface", "Bytes Received/sec", instance));

                result.Add(new NetworkInfo
                {
                    Name = instance,
                    Sent = networkCounters[instance + "_sent"].NextValue().ToString(),
                    Received = networkCounters[instance + "_received"].NextValue().ToString(),
                });
            }
            return result;
        }
        public static IList<DiskInfo> GetDiskInfo()
        {
            var result = new List<DiskInfo>();
            PerformanceCounterCategory category = new PerformanceCounterCategory("LogicalDisk");
            String[] instanceNames = category.GetInstanceNames();
            foreach (var instance in instanceNames)
            {
                if (instance.Length > 2)
                    continue;
                if (!diskCounters.ContainsKey(instance + "_read"))
                    diskCounters.Add(instance + "_read", new PerformanceCounter("LogicalDisk", "Disk Read Bytes/sec", instance));
                if (!diskCounters.ContainsKey(instance + "_write"))
                    diskCounters.Add(instance + "_write", new PerformanceCounter("LogicalDisk", "Disk Write Bytes/sec", instance));
                if (!diskCounters.ContainsKey(instance + "_readwrite"))
                    diskCounters.Add(instance + "_readwrite", new PerformanceCounter("LogicalDisk", "Disk Bytes/sec", instance));
                if (!diskCounters.ContainsKey(instance + "_free"))
                    diskCounters.Add(instance + "_free", new PerformanceCounter("LogicalDisk", "% Free Space", instance));

                var totalSpace = GetHardDiskSpace(instance);
                var freeSpace = GetHardDiskFreeSpace(instance);
                var usedSpace = totalSpace - freeSpace;
                result.Add(new DiskInfo
                {
                    DiskRead = diskCounters[instance + "_read"].NextValue().ToString(),
                    DiskWrite = diskCounters[instance + "_write"].NextValue().ToString(),
                    DiskReadWrite = diskCounters[instance + "_readwrite"].NextValue().ToString(),
                    Name = instance,
                    TotalSpace = totalSpace.ToString(),
                    FreeSpaceN = freeSpace.ToString(),
                    UsedSpaceN = usedSpace.ToString(),
                    FreeSpace = Math.Round(diskCounters[instance + "_free"].NextValue(), 2, MidpointRounding.AwayFromZero).ToString(),
                    UsedSpace = Math.Round(((double)usedSpace / (double)totalSpace) * 100, 2, MidpointRounding.AwayFromZero).ToString(),
                });

            }
            return result;
        }
        ///  <summary>
        /// 获取指定驱动器的空间总大小(单位为Byte)
        ///  </summary>
        ///  <param name="str_HardDiskName">只需输入代表驱动器的字母:即可 （大写）</param>
        ///  <returns> </returns>
        public static long GetHardDiskSpace(string str_HardDiskName)
        {
            long totalSize = new long();
            str_HardDiskName = str_HardDiskName + "\\";
            System.IO.DriveInfo[] drives = System.IO.DriveInfo.GetDrives();
            foreach (System.IO.DriveInfo drive in drives)
            {
                if (drive.Name == str_HardDiskName)
                {
                    totalSize = drive.TotalSize;
                }
            }
            return totalSize;
        }

        ///  <summary>
        /// 获取指定驱动器的剩余空间总大小(单位为Byte)
        ///  </summary>
        ///  <param name="str_HardDiskName">只需输入代表驱动器的字母:即可 </param>
        ///  <returns> </returns>
        public static long GetHardDiskFreeSpace(string str_HardDiskName)
        {
            long freeSpace = new long();
            str_HardDiskName = str_HardDiskName + "\\";
            System.IO.DriveInfo[] drives = System.IO.DriveInfo.GetDrives();
            foreach (System.IO.DriveInfo drive in drives)
            {
                if (drive.Name == str_HardDiskName)
                {
                    freeSpace = drive.TotalFreeSpace;
                }
            }
            return freeSpace;
        }
    }
}
