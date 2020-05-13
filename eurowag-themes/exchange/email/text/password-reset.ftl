<#ftl output_format="plainText">
<#assign lastUpdated = .now>
${msg("passwordResetBody",link, linkExpiration, user.username, linkExpirationFormatter(linkExpiration), lastUpdated?string["dd.MM.yyyy HH:mm"])}