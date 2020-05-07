<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.png" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="ew">
    <header class="ew-header">
	    <div id="ew-logo"></div>
    	<div id="ew-header-flag">
			<#if realm.internationalizationEnabled  && locale.supported?size gt 1>
				<div id="kc-locale">
					<div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
						<div class="kc-dropdown" id="kc-locale-dropdown">
							<a href="#" id="kc-current-locale-link"><span class="flag-icon flag-icon-lg flag-icon-${locale.currentLanguageTag}"></span><b>${locale.currentLanguageTag}</b></a>
							<ul>
								<#list locale.supported as l>
									<li class="kc-dropdown-item"><a href="${l.url}"><span class="flag-icon flag-icon-lg flag-icon-${l.languageTag}"></span><b>${l.languageTag}</b></a></li>
								</#list>
							</ul>
						</div>
					</div>
				</div>
			</#if>
		</div>
    </header>
  
    <div class="ew-body">
        <main class="ew-content">
  
			<div id="kc-content">
				<div id="kc-content-wrapper">
					<div id="ew-scroll">
						<h1 id="kc-page-title"><#nested "header"></h1>
	  
						<#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
							<div class="alert alert-${message.type}">
								<#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
								<#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
								<#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
								<#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
								<span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
							</div>
						</#if>
	  
						<#nested "form">
						
						<#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
							<form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post" <#if displayWide>class="${properties.kcContentWrapperClass!}"</#if>>
								<div <#if displayWide>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
									<div class="${properties.kcFormGroupClass!}">
										<input type="hidden" name="tryAnotherWay" value="on" />
										<a href="#" id="try-another-way" onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
									</div>
								</div>
							</form>
						</#if>
						
						<#if displayInfo>
							<div id="kc-info" class="${properties.kcSignUpClass!}">
								<div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
									<#nested "info">
								</div>
							</div>                    
						</#if>
						
					</div>
				</div>			
			</div>
	  
			<div id="help-section">
				<div id="help-section-wrapper">
					<div>${msg("help")}</div>
					<div>${msg("call.suport")}: <b>${properties.phone}</b></div>
				</div>
			</div>

        </main>

        <div class="ew-nav"><div id="truck"></div></div>
    </div>
</body>

</html>
</#macro>














