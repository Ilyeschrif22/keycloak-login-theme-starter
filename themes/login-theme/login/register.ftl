<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("registerTitle")!"Register"}
    <#elseif section = "form">
        <p class="text">Create your account to get started</p>

        <#if social?? && social.providers??>
            <div id="kc-social-providers">
                <#list social.providers as p>
                    <a href="${p.loginUrl}" id="social-${p.alias}" class="gmail-button">
                        <span>${p.displayName}</span>
                    </a>
                </#list>
            </div>
            <span class="or-text">Or</span>
        </#if>

        <form id="kc-form-register" action="${url.registrationAction}" method="post">

            <#if !realm.registrationEmailAsUsername>
                <div class="email-input">
                    <input
                        tabindex="1"
                        id="username"
                        name="username"
                        type="text"
                        placeholder="Choose a username"
                        value="${(register.formData.username)!''}"
                        autocomplete="off"
                        autofocus
                    />
                </div>
                <#if messagesPerField.existsError('username')>
                    <span class="input-error-text">${kcSanitize(messagesPerField.get('username'))?no_esc}</span>
                </#if>
            </#if>

            <div class="email-input">
                <input
                    tabindex="2"
                    id="email"
                    name="email"
                    type="email"
                    placeholder="Enter email address"
                    value="${(register.formData.email)!''}"
                    autocomplete="off"
                    <#if realm.registrationEmailAsUsername>autofocus</#if>
                />
            </div>
            <#if messagesPerField.existsError('email')>
                <span class="input-error-text">${kcSanitize(messagesPerField.get('email'))?no_esc}</span>
            </#if>

            <div class="email-input">
                <input
                    tabindex="3"
                    id="password"
                    name="password"
                    type="password"
                    placeholder="Enter password"
                    autocomplete="off"
                />
            </div>
            <#if messagesPerField.existsError('password')>
                <span class="input-error-text">${kcSanitize(messagesPerField.get('password'))?no_esc}</span>
            </#if>

            <div class="email-input">
                <input
                    tabindex="4"
                    id="password-confirm"
                    name="password-confirm"
                    type="password"
                    placeholder="Confirm password"
                    autocomplete="off"
                />
            </div>
            <#if messagesPerField.existsError('password-confirm')>
                <span class="input-error-text">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</span>
            </#if>

            <button type="submit" class="continue-button" tabindex="5">
                <span class="continue-text">${msg("doRegister")!"Register"}</span>
            </button>
        </form>

        <span class="signin-redirect">
            Already have an account? 
            <a href="${url.loginUrl}" class="signin-link">${msg("doLogIn")!"Sign in"}</a>
        </span>

        <span class="terms-of-services">
            By signing up you agree to our 
            <span class="underline">Terms of service</span> &
            <span class="underline">Privacy policy</span>
        </span>
    </#if>
</@layout.registrationLayout>