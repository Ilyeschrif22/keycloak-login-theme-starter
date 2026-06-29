<#macro registrationLayout>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><#nested "header"/></title>
    <link href="${url.resourcesPath}/css/login.css" rel="stylesheet">
</head>
<body>
    <div class="main-container">
        <div class="image-container">
            <div class="placeholder-bg"></div>
        </div>
        <div class="form-container">
            <#nested "form"/>
        </div>
    </div>
</body>
</html>
</#macro>
