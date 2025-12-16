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
public class MainActivity {

    @Request("/")
    @Dispatch("templates/default")
    @Action("page")
    public Map<String, String> template() {
        return Map.of(
                "headline", "Aspectran Assets",
                "include", "index"
                );
    }

}
