
[![Build
Status](https://travis-ci.org/ices-tools-prod/icesTAFWeb.svg?branch=devel)](https://travis-ci.org/ices-tools-prod/icesTAFWeb)
[![CRAN
Status](http://r-pkg.org/badges/version/icesTAFWeb)](https://cran.r-project.org/package=icesTAFWeb)
[![CRAN
Monthly](http://cranlogs.r-pkg.org/badges/icesTAFWeb)](https://cran.r-project.org/package=icesTAFWeb)
[![CRAN
Total](http://cranlogs.r-pkg.org/badges/grand-total/icesTAFWeb)](https://cran.r-project.org/package=icesTAFWeb)

[<img align="right" alt="ICES Logo" width="17%" height="17%" src="http://ices.dk/_layouts/15/1033/images/icesimg/iceslogo.png">](http://ices.dk)

``` r
library(knitr)
library(icesTAFWeb)
```

# icesTAFWeb

icesTAFWeb Functions to support the creation of ICES Fisheries
Overviews, ….

icesTAFWeb is implemented as an [R](https://www.r-project.org) package
<!-- and available on [CRAN](https://cran.r-project.org/package=icesTAFWeb). -->
and available on GitHub

## Installation

icesTAFWeb can be installed from GitHub using the `install_github`
command from the `remotes` package:

``` r
library(remotes)
install_github("ices-tools-prod/icesTAFWeb")
```

## Usage

For a summary of the package:

``` r
library(icesTAFWeb)
?icesTAFWeb
```

## Examples

## Download a list of public TAF assessments

To get a list of all the publicly available projects on TAF use the
function `taf_projects()`

``` r
public_taf <- taf_projects()
```

    ## GETing ... http://localhost:5012/project

    ## using token for user ICES\colin

    ## Internal Server Error (HTTP 500).
    ## 
    ## : Something went wrong on the server :(
    ## No encoding supplied: defaulting to UTF-8.

``` r
# show a subset
kable(head(public_taf)[c(1,10,17,20,22,9)])
```

| x                                                                                                                                                                                                                                                                                            |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Newtonsoft.Json.JsonSerializationException: Cannot deserialize the current JSON object (e.g. {“name”:“value”}) into type ‘System.Collections.Generic.IEnumerable\`1\[ICES.TAF.Api.Models.Api.ProjectDto\]’ because the type requires a JSON array (e.g. \[1,2,3\]) to deserialize correctly. |

To fix this error either change the JSON to a JSON array
(e.g. \[1,2,3\]) or change the deserialized type so that it is a normal
.NET type (e.g. not a primitive type like integer, not a collection type
like an array or List<T>) that can be deserialized from a JSON object.
JsonObjectAttribute can also be added to the type to force it to
deserialize from a JSON object. Path ‘name’, line 1, position 8. at
Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateObject(JsonReader
reader, Type objectType, JsonContract contract, JsonProperty member,
JsonContainerContract containerContract, JsonProperty containerMember,
Object existingValue) at
Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader
reader, Type objectType, Boolean checkAdditionalContent) at
Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader,
Type objectType) at
Newtonsoft.Json.JsonSerializer.Deserialize(JsonReader reader, Type
objectType) at Newtonsoft.Json.JsonConvert.DeserializeObject(String
value, Type type, JsonSerializerSettings settings) at
Newtonsoft.Json.JsonConvert.DeserializeObject[T](String%20value,%20JsonSerializerSettings%20settings)
at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String%20value) at
ICES.TAF.Api.Extensions.HttpClientExtensions.ReadContentAs[T](HttpResponseMessage%20response)
in D:-taf\_web\_pages.TAF.TAF.Api.cs:line 19 at
ICES.TAF.Api.Services.ProjectService.GetProjectList() in
D:-taf\_web\_pages.TAF.TAF.Api.cs:line 26 at
ICES.TAF.Api.Controllers.ProjectController.ListProjectsAsync() in
D:-taf\_web\_pages.TAF.TAF.Api.cs:line 33 at
Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper
mapper, ObjectMethodExecutor executor, Object controller, Object\[\]
arguments) at
Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g\_\_Logged|12\_1(ControllerActionInvoker
invoker) at
Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g\_\_Awaited|10\_0(ControllerActionInvoker
invoker, Task lastTask, State next, Scope scope, Object state, Boolean
isCompleted) at
Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed
context) at
Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State&
next, Scope& scope, Object& state, Boolean& isCompleted) at
Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g\_\_Awaited|13\_0(ControllerActionInvoker
invoker, Task lastTask, State next, Scope scope, Object state, Boolean
isCompleted) at
Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g\_\_Awaited|19\_0(ResourceInvoker
invoker, Task lastTask, State next, Scope scope, Object state, Boolean
isCompleted) at
Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g\_\_Logged|17\_1(ResourceInvoker
invoker) at
Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g\_\_AwaitRequestTask|6\_0(Endpoint
endpoint, Task requestTask, ILogger logger) at
Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext
context) at
Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext
httpContext) at
Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext
httpContext, ISwaggerProvider swaggerProvider) at
Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext
context)

# HEADERS

Accept: application/json, text/xml, application/xml, */*
Accept-Encoding: deflate, gzip Authorization: Bearer
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjb2xpbiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiY29saW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiY29saW4iLCJqdGkiOiIyNTJiZWU4NC0xZTg5LTRkYjAtYTM1ZC0zYmIyZmE1YzZlNDQiLCJHaXRIdWJSb2xlIjpbIm93bmVyIiwib3duZXIiLCJhZG1pbiIsImFkbWluIl0sIkdpdEh1YlRva2VuIjoiYjc5OTJkZTgzOTllNTUzMzUzODU0ZmNkMzI4YmUwYWMyNjAwMDY0MiIsIlNQX0Fkdmlzb3J5IFN0YWZmIjoicmVhZCIsIlNQX0VVIERHTUFSRSBTZWFiYXNzIFNpbXVsYXRpb24gVG9vbCI6InJlYWQiLCJTUF9JQ0VTIHN0YWZmIjoicmVhZCIsIlNQX0lDRVMgVk1TIERhdGEgQ2FsbCBPd25lcnMiOiJyZWFkIiwiU1BfSUNFUyBWTVMgRGF0YSBVc2VycyI6InJlYWQiLCJTUF9JQ0VTIFZNUyBXR0ZJVEJJVCBEYXRhIFVzZXJzIjoicmVhZCIsIlNQX01HV0ciOiJyZWFkIiwiU1BfUmVxdWVzdHNfTmV3IE93bmVycyI6InJlYWQiLCJTUF9TZWFiYXNzIFRvb2wiOiJyZWFkIiwiU1BfVEFGIEFkbWluIjoicmVhZCIsIlNQX1RBRiBNYW5hZ2VycyI6InJlYWQiLCJTUF9UQyBBZG1pbmlzdHJhdG9ycyI6InJlYWQiLCJTUF9UQ1NBSTE5IjoicmVhZCIsIlNQX1RDU0FJIDIwMTgiOiJyZWFkIiwiU1BfVk1TIGRhdGEgcmVxdWVzdCI6InJlYWQiLCJTUF9XR05TU0siOiJyZWFkIiwiU1BfV0dTRkQiOiJyZWFkIiwiU1BfV0dTRkRHT1YiOiJyZWFkIiwiU1BfV0dUQUZHT1YiOiJyZWFkIiwiU1BfV0tDSEFJUlMiOiJyZWFkIiwiU1BfV0tEQ1ZNUyI6InJlYWQiLCJTUF9XS0VFTERBVEEyIjoicmVhZCIsIlNQX1dLRU5TRU1CTEUiOiJyZWFkIiwiU1BfV0tFTlNFTUJMRSBNZW1iZXJzIjoicmVhZCIsIlNQX1dLRklTSERJU0giOiJyZWFkIiwiU1BfV0tHTVNFMyI6InJlYWQiLCJTUF9XS01TWUNBVDM0IjoicmVhZCIsIlNQX1dLUkRCLUVTVCI6InJlYWQiLCJTUF9XS1JGU0FNIjoicmVhZCIsIlNQX1dLU1RPQ0tBREUiOiJyZWFkIiwiU1BfV0tUYURTQSI6InJlYWQiLCJTUF9XS1RBRiI6InJlYWQiLCJHSF9EZXZlbG9wbWVudCB0ZWFtIjoicmVhZCIsIkdIX3Byb2plY3QtYWRtaW5zIjoicmVhZCIsIkdIX0lDRVMgc3RhZmYiOiJyZWFkIiwiR0hfSUNFUyBWTVMgRGF0YSBDYWxsIE93bmVycyI6InJlYWQiLCJHSF9TbWFydERvdHMiOiJyZWFkIiwiR0hfTkFHIGxpY2Vuc2UgaG9sZGVycyI6InJlYWQiLCJHSF9BY291c3RpY1RBRi1SZWR1cyI6InJlYWQiLCJHSF9GaXNoZXJpZXNPdmVydmlld3MiOiJyZWFkIiwiR0hfVEFGIE1hbmFnZXJzIjoicmVhZCIsIkdIX0V4cGVydCBncm91cHMgdGhlbWVzIjoicmVhZCIsIkdIX1JEQkVTLlNFIjoicmVhZCIsIkdIX1JEQkVTLkRLIjoicmVhZCIsIkdIX1RBRiBBZG1pbiI6InJlYWQiLCJHSF9XR1RBRkdPViI6InJlYWQiLCJleHAiOjE2MDYyMDU4NjAsImlzcyI6Imh0dHA6Ly90YWYuaWNlcy5kayIsImF1ZCI6Imh0dHA6Ly90YWYuaWNlcy5kayJ9.qjQo9uRBU642JcyT7r\_hyytNHU2oN6WKJnJM60WQK30
Host: localhost:5012 User-Agent: libcurl/7.64.1 r-curl/4.3 httr/1.4.2 |
|NA | |NA | |NA | |NA | |NA |

# to build this github\_document

``` r
rmarkdown::render("README.Rmd")
```
