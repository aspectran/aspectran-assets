<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
    <!-- Sidebar TOC -->
    <div class="col-lg-3 page-sidebar page-sidebar-sm order-lg-1 py-3 py-lg-4">
        <aside class="sidebar-sticky">
            <div id="toc">
                <h5 class="toc-title underline bi bi-list-nested"> Table of Contents</h5>
                <ul class="list-unstyled">
                </ul>
            </div>
        </aside>
    </div>

    <!-- Main Content -->
    <div class="col-lg-9 page-main order-lg-2 py-3 py-lg-4">
        <article>
            <span itemprop="articleBody">
                <p class="lead">Aspectran is a lightweight, high-performance Java framework designed to build everything from standalone console tools and background daemons to enterprise-grade web applications with high throughput and low overhead.</p>

                <h2>1. Introduction &amp; Overview</h2>
                <p>Software frameworks often grow complex over time as they accumulate features and backward compatibility layers. This complexity leads to steep learning curves, cumbersome configuration, and reduced developer productivity. Aspectran was engineered specifically to solve this dilemma.</p>

                <h3>1.1 Background and Motivation</h3>
                <p>In modern enterprise environments, development speed and architectural clarity are paramount. Aspectran addresses the fundamental question: <em>"Can feature richness coexist with architectural simplicity?"</em> By providing an intuitive and unified component model, Aspectran offers an agile alternative to heavier enterprise frameworks.</p>

                <h3>1.2 Design Philosophy: Sustainable Simplicity</h3>
                <p>Aspectran's guiding principle is <strong>Sustainable Simplicity</strong>. Every feature is intentionally designed so that the framework remains lightweight, transparent, and easy to maintain even as application scale grows.</p>
                <div class="alert alert-info d-flex align-items-center" role="alert">
                    <i class="bi bi-info-circle-fill fs-4 me-3"></i>
                    <div>
                        <strong>Core Takeaway:</strong> Sustainable simplicity is achieved by isolating external configuration from internal runtime execution through a unified rule model.
                    </div>
                </div>

                <h3>1.3 Evolution from Translets to Aspectran</h3>
                <p>When development first began in March 2008, the project was originally named <strong>Translets</strong> (a portmanteau of <em>Transformation</em> and <em>Servlet</em>). As Aspect-Oriented Programming (AOP) became a core foundational pillar, the framework was renamed to <strong>Aspectran</strong> in July 2012, symbolizing the fusion of modular Aspects and streamlined Translet processing.</p>

                <h2>2. Core Architecture &amp; Concepts</h2>
                <p>At the heart of Aspectran is a consistent and declarative execution engine. It decouples the definition of components from their runtime execution context.</p>

                <h3>2.1 Translet Execution Pipeline</h3>
                <p>A <strong>Translet</strong> represents a single atomic unit of request processing. It handles incoming requests, executes configured actions and bean methods, applies aspect advice, and routes the output to the appropriate response view dispatcher.</p>
                <pre class="bg-body-secondary p-3 rounded"><code>&lt;translet name="/user/profile"&gt;
    &lt;action id="user" bean="userService" method="getUserProfile"/&gt;
    &lt;transform type="json"&gt;
        &lt;property name="user" value="\#{user}"/&gt;
    &lt;/transform&gt;
&lt;/translet&gt;</code></pre>

                <h3>2.2 Activity Context and Request Lifecycle</h3>
                <p>An <strong>Activity</strong> encapsulates the entire context of a single request-response cycle across any environment—whether it's an HTTP web request, a shell command invocation, or a scheduled daemon task.</p>

                <h3>2.3 Separation of Concerns (Translet, Bean, Aspect)</h3>
                <p>Aspectran strictly separates responsibilities into three distinct primitives:</p>
                <ul class="list-group list-group-flush mb-3">
                    <li class="list-group-item"><strong>Translet:</strong> Focuses solely on workflow orchestration, request handling, and response delivery.</li>
                    <li class="list-group-item"><strong>Bean:</strong> Reusable business components, state managers, and domain services.</li>
                    <li class="list-group-item"><strong>Aspect:</strong> Cross-cutting concerns such as security, transaction management, auditing, and logging.</li>
                </ul>

                <h3>2.4 Rule-Based Internal Model</h3>
                <p>External configuration files (XML or APON) are parsed into standardized Java <code>*Rule</code> objects (e.g., <code>TransletRule</code>, <code>BeanRule</code>, <code>AspectRule</code>). This keeps the runtime engine decoupled from configuration syntax and parsing intricacies.</p>

                <h2>3. Component &amp; Bean Management</h2>
                <p>The Inversion of Control (IoC) container in Aspectran manages the full lifecycle of beans with minimal reflection overhead and fast instantiation.</p>

                <h3>3.1 Bean Definitions and Scopes</h3>
                <p>Aspectran supports standard lifecycle scopes including <code>singleton</code>, <code>prototype</code>, <code>request</code>, and <code>session</code>. Beans can be declared via XML, APON, or annotated Java classes.</p>

                <h3>3.2 Factory Beans and Lifecycle Callbacks</h3>
                <p>Complex bean instantiation logic can be encapsulated using factory beans implementing <code>FactoryBean&lt;T&gt;</code>, supporting explicit initialization and destruction hooks.</p>

                <h3>3.3 Dynamic Parameter and Property Injection</h3>
                <p>Using the Aspectran Expression Language (AsEL), beans and translets dynamically reference environment variables (<code>%{...}</code>), other beans (<code>\#{...}</code>), and request parameters.</p>

                <h2>4. Aspect-Oriented Programming (AOP)</h2>
                <p>Aspectran provides a non-invasive AOP engine capable of intercepting requests before, around, and after translet or bean execution.</p>

                <h3>4.1 Pointcut Expressions and Joinpoints</h3>
                <p>Flexible pointcuts match translet names and method patterns with inclusion and exclusion rules:</p>
                <pre class="bg-body-secondary p-3 rounded"><code>&lt;aspect id="authFilter"&gt;
    &lt;joinpoint&gt;
        pointcut: {
            +: /admin/**
            -: /admin/login
        }
    &lt;/joinpoint&gt;
    &lt;advice&gt;
        &lt;before&gt;
            &lt;action bean="authService" method="validateSession"/&gt;
        &lt;/before&gt;
    &lt;/advice&gt;
&lt;/aspect&gt;</code></pre>

                <h3>4.2 Advice Actions and Interceptors</h3>
                <p>Advices can be scheduled at <code>before</code>, <code>after</code>, <code>around</code>, and <code>finally</code> stages, allowing complete control over execution flow and data transformation.</p>

                <h3>4.3 Exception Handling and Fallbacks</h3>
                <p>Aspects can define dedicated exception handlers (<code>&lt;exception&gt;</code>) to catch thrown errors, log diagnostics, and route users to customized error pages.</p>

                <h2>5. View &amp; Template Engine Integration</h2>
                <p>Aspectran seamlessly bridges Java backend logic with modern presentation layers.</p>

                <h3>5.1 Thymeleaf Integration with Layout Dialect</h3>
                <p>First-class support for Thymeleaf templates and the hierarchical Layout Dialect allows developers to create modular master templates, plates, and reusable fragments.</p>

                <h3>5.2 JSP and JSTL Tag Library Support</h3>
                <p>Full support for JavaServer Pages (JSP) and standard tag libraries ensures compatibility with existing enterprise assets and custom JSP tag extensions.</p>

                <h3>5.3 JSON, XML, and APON Content Negotiation</h3>
                <p>Built-in transform dispatchers automatically serialize activity responses to JSON, XML, Plain Text, or APON based on request headers and URI extensions.</p>

                <h2>6. Execution Environments</h2>
                <p>A defining characteristic of Aspectran is its polymorphic runtime capability—the exact same business logic can run inside diverse server and client runtimes.</p>

                <h3>6.1 Web Activity &amp; Servlet Integration</h3>
                <p>Aspectran integrates cleanly into any standard Jakarta Servlet container via <code>WebActivityServlet</code>, providing full web request lifecycle management.</p>

                <h3>6.2 High-Performance Embedded Undertow Server</h3>
                <p>With native Undertow server support, Aspectran can boot high-performance non-blocking HTTP and WebSocket servers with ultra-low latency and minimal memory overhead.</p>

                <h3>6.3 Interactive Shell &amp; REPL Console</h3>
                <p>The interactive Aspectran Shell lets operators inspect context beans, execute translets interactively, decrypt configuration properties, and monitor system metrics in real time.</p>

                <h3>6.4 Background Daemon &amp; Scheduled Tasks</h3>
                <p>Long-running background daemons and cron-based schedulers execute translets periodically or in response to filesystem command queues.</p>

                <h2>7. Advanced Features &amp; Configuration</h2>
                <p>Aspectran offers advanced enterprise tooling out of the box without requiring third-party library dependencies.</p>

                <h3>7.1 APON (Aspectran Parameter Object Notation)</h3>
                <p>APON is a human-friendly, lightweight object notation tailored for configuration files and hierarchical data exchange, combining the readability of YAML with the simplicity of JSON.</p>

                <h3>7.2 Session Clustering &amp; Distributed Store</h3>
                <p>Enterprise clustering support provides high-availability session persistence using file-backed or distributed data stores with automatic eviction and scavenging.</p>

                <h3>7.3 WebSocket &amp; Real-Time Communication</h3>
                <p>Built-in WebSocket endpoints enable bidirectional real-time communication for dashboard push notifications, event streams, and live monitoring.</p>

                <h2>8. Performance Optimization &amp; Best Practices</h2>
                <p>Architected for high throughput and predictable latency, Aspectran delivers exceptional performance across microservices and monolithic applications.</p>

                <h3>8.1 Lightweight Memory Footprint</h3>
                <p>By avoiding heavy classpath scanning and bloated reflection metadata, Aspectran applications routinely run comfortably within memory-constrained containers.</p>

                <h3>8.2 Fast Startup and Request Dispatching</h3>
                <p>Pre-compiled rule trees and optimized translet routing ensure near-instant cold startups and microsecond request dispatch times.</p>

                <h2>9. Conclusion &amp; Summary</h2>
                <p>Aspectran proves that powerful enterprise capabilities do not necessitate architectural complexity. With its unified component model, elegant AOP integration, and adaptable runtime environments, Aspectran empowers developers to build clean, maintainable, and blistering-fast applications on the JVM.</p>
            </span>
        </article>
    </div>
</div>
