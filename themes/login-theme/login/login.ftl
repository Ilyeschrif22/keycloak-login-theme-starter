<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("loginTitle")}
    <#elseif section = "form">
        <p class="text">Sign in to your account</p>

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

        <form id="kc-form-login" action="${url.loginAction}" method="post">
            <div class="email-input">
                <input 
                    tabindex="1" 
                    id="username" 
                    name="username" 
                    value="${(login.username)!''}" 
                    type="text"
                    placeholder="Enter Username"
                    autofocus 
                    autocomplete="off" 
                />
            </div>

            <#if messagesPerField.existsError('username')>
                <span class="input-error-text">${kcSanitize(messagesPerField.get('username'))?no_esc}</span>
            </#if>

            <div class="email-input">
                <input 
                    tabindex="2" 
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

            <#if messagesPerField.exists('login')>
                <span class="input-error-text">${kcSanitize(messagesPerField.get('login'))?no_esc}</span>
            </#if>

            <div class="form-options">
                <#if realm.rememberMe>
                    <div class="checkbox-container">
                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" <#if login.rememberMe??>checked</#if>>
                        <label for="rememberMe">${msg("rememberMe")}</label>
                    </div>
                </#if>
                <#if realm.resetPasswordAllowed>
                    <a tabindex="5" href="${url.loginResetCredentialsUrl}" class="forgot-password">${msg("doForgotPassword")}</a>
                </#if>
            </div>

            <button type="submit" class="continue-button" tabindex="4">
                <span class="continue-text">${msg("doLogIn")}</span>
            </button>
        </form>

      <#if realm.registrationAllowed>
    <span class="signin-redirect">
        Don't have an account? 
        <a href="${url.registrationUrl}" class="signin-link">${msg("doRegister")}</a>
    </span>
</#if>

        <span class="terms-of-services">
            By signing in you agree to our 
            <span class="underline">Terms of service</span> &
            <span class="underline">Privacy policy</span>
        </span>
    </#if>
</@layout.registrationLayout>
