using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.Routing;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.AspNetCore.Razor.TagHelpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lkWeb.TagHelpers
{
    [HtmlTargetElement("multiSelect", Attributes = ForAttributeName)]
    [HtmlTargetElement("multiSelect", Attributes = ValueAttributeName)]
    [HtmlTargetElement("multiSelect", Attributes = DataSourceAttributeName)]
    [HtmlTargetElement("multiSelect", Attributes = ReadonlyAttributeName)]
    public class MultiSelectTagHelper : TagHelper
    {
        private readonly IHtmlGenerator generator;
        private readonly IUrlHelperFactory factory;
        private readonly IHtmlHelper htmlHelper;

        public MultiSelectTagHelper(IHtmlHelper htmlHelper, IHtmlGenerator generator)
        {
            this.generator = generator;
            this.factory = factory;
            this.htmlHelper = htmlHelper;
        }

        private const string ForAttributeName = "asp-for";
        private const string ValueAttributeName = "asp-value";
        private const string DataSourceAttributeName = "asp-dataSource";
        private const string ReadonlyAttributeName = "asp-readonly";

        [HtmlAttributeNotBound]
        [ViewContext]
        public ViewContext ViewContext { get; set; }

        [HtmlAttributeName(ForAttributeName)]
        public ModelExpression For { get; set; }

        [HtmlAttributeName(ValueAttributeName)]
        public List<string> Value { get; set; }


        [HtmlAttributeName(DataSourceAttributeName)]
        public Dictionary<string, string> DataSource { get; set; }

        [HtmlAttributeName(ReadonlyAttributeName)]
        public bool Readonly { get; set; }

        public override void Process(TagHelperContext context, TagHelperOutput output)
        {
            output.TagName = "div";
            //output.Attributes.Add("class", "multiselect-drop");

            MultiSelectList selectList = new MultiSelectList(this.DataSource, "Key", "Value", this.Value);

            HtmlContentBuilder builder = new HtmlContentBuilder();

            string id;
            if (For == null)
            {
                id = output.Attributes["id"].Value.ToString();
                output.Attributes.Remove(output.Attributes["id"]);

                string options = string.Empty;
                foreach (SelectListItem item in selectList)
                {
                    options += $"<option value=\"{item.Value}\" {(item.Selected ? "selected" : "")}>{item.Text}</option>";
                }

                builder.AppendHtml($"<select id=\"{id}\" name=\"{id}\" multiple=\"multiple\">{options}</select>");
            }
            else
            {
                id = For.Name;

                TagBuilder dropDown = generator.GenerateSelect(ViewContext, For.ModelExplorer, null, For.Name, selectList, true, null);
                builder.AppendHtml(dropDown);
            }

            output.Content.AppendHtml(builder);

            //Contextualize the html helper
            (htmlHelper as IViewContextAware).Contextualize(ViewContext);

            ViewDataDictionary data = new ViewDataDictionary(this.ViewContext.ViewData);
            data["Id"] = id;
            data["Readonly"] = this.Readonly;

            var content = htmlHelper.Partial("TagHelpers/MultiSelect/MultiSelect", data);
            output.Content.AppendHtml(content);

            base.Process(context, output);
        }
    }
}

