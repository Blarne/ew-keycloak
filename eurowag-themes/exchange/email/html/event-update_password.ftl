<#assign lastUpdated = .now>
<html>
<body>
${kcSanitize(msg("passwordResetBodyHtml",link, linkExpiration, user.username, linkExpirationFormatter(linkExpiration), lastUpdated?string["dd.MM.yyyy HH:mm"]))?no_esc}
</body>
</html>