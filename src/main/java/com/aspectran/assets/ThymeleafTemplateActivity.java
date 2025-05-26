package com.aspectran.assets;

import com.aspectran.core.component.bean.annotation.Component;
import com.aspectran.core.component.bean.annotation.Dispatch;
import com.aspectran.core.component.bean.annotation.Request;

/**
 * <p>Created: 2025. 5. 24.</p>
 */
@Component("thymeleaf")
public class ThymeleafTemplateActivity {

    @Request("/")
    @Dispatch("index")
    public void thymeleaf() {
    }

}
