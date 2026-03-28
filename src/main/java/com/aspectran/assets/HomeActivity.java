package com.aspectran.assets;

import com.aspectran.core.component.bean.annotation.Action;
import com.aspectran.core.component.bean.annotation.Component;
import com.aspectran.core.component.bean.annotation.Dispatch;
import com.aspectran.core.component.bean.annotation.Request;

import java.util.Map;

/**
 * <p>Created: 2025. 5. 24.</p>
 */
@Component("/")
public class HomeActivity {

    @Request("/")
    @Dispatch("index")
    @Action("page")
    public Map<String, String> template() {
        return Map.of(
                "subheadline", "Frontend Asset Hub",
                "headline", "Aspectran Assets",
                "teaser", "Modern and reusable web components, templates, and styles for building high-performance Aspectran applications."
        );
    }

}
