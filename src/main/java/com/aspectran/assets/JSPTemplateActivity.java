package com.aspectran.assets;

import com.aspectran.core.component.bean.annotation.Action;
import com.aspectran.core.component.bean.annotation.Component;
import com.aspectran.core.component.bean.annotation.Dispatch;
import com.aspectran.core.component.bean.annotation.Request;
import com.aspectran.utils.StringUtils;

import java.util.Map;

/**
 * <p>Created: 2025. 5. 24.</p>
 */
@Component("/jsp")
public class JSPTemplateActivity {

    @Request("/templates/${page}/${style}")
    @Dispatch("templates/${page}")
    @Action("page")
    public Map<String, String> template(String style) {
        return Map.of(
                "style", StringUtils.nullToEmpty(style),
                "subheadline", (style != null ? "JSP Templates" : ""),
                "headline", (style == null ?"JSP Templates" : StringUtils.nullToEmpty(style).toUpperCase()),
                "include", "index"
                );
    }

    @Request("/samples/appmon")
    @Dispatch("templates/default")
    @Action("page")
    public Map<String, String> appmon() {
        return Map.of(
                "style", "fluid compact",
                "include", "samples/appmon/appmon",
                "headinclude", "samples/appmon/_domains"
                );
    }

    @Request("/samples/mastheadimage")
    @Dispatch("templates/default")
    @Action("page")
    public Map<String, String> mastheadimage() {
        return Map.of(
                "style", "fluid",
                "subheadline", "Aspectran based",
                "headline", "Projects",
                "teaser", "We are developing useful applications based on Aspectran.",
                "include", "index",
                "headimageinclude", "samples/masthead/_headimage"
                );
    }

}
