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
    <title>${msg("internal.header",(realm.displayName!''))}</title>
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

    <link href="//fonts.googleapis.com/css?family=Open+Sans&amp;subset=latin-ext,latin" rel="stylesheet" type="text/css">
</head>


<body class="ew" id="ew-container">

	<main class="ew-content" id="panel-dialog">
		<div id="kc-content">

			<div id="panel-login">
				<div id="header" class="clearfix">
        	    	<div>
                		<p class="logo">
                        	<a href="http://www.eurowag.com/cs?manualSelection=cs" title="EUROWAG"></a>
	                    </p>
			</div>

					

                </div>

			    <div style="padding-left: 20px;">
                   <h2>
			          ${msg("internal.header")}
			       </h2>
			       <p class="description">
			          ${msg("internal.desc")}
			       </p>    
                    <span class="inline-btn btn-blue-light mrgtop20px" style="margin-bottom: 20px; background: none;">
                        <#nested "form">				    
                    </span>
           	    </div>
			</div>

                 <div id="footer">
                 
	            <div class="mastercard">
	                The EUROWAG MasterCard is issued by Crosscard S.A. pursuant to a license from MasterCard International Incorporated. MasterCard and the MasterCard Brand Mark are registered trademarks of MasterCard International Incorporated. Crosscard S.A., registered office at 48 rue de  Bragance, L-1255 Luxembourg ID No.: B215831, is authorised by the Commission de Surveillance du Secteur Financier (CSSF) as an electronic money institution. All communications should be sent to W.A.G. payment solutions, a.s., Na Vítězné pláni 1719/4, Prague 140 00, Czech Republic.
	            </div>
	            <strong>©<strong>W.A.G. payment solutions, a.s.</strong></strong>
	        </div>

	     </div>

    </main>

</body>

</html>
</#macro>














