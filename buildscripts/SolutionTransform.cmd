REM ***********************************************************
REM The following creates the Silverlight solution
REM ***********************************************************



REM The following removes logging

%~dp0..\tools\SolutionTransform\SolutionTransform Modify --solution %~dp0..\Castle.Core-vs2008.sln --rename -SL --remove Castle.Services.Logging.log4netIntegration-vs2008 Castle.Services.Logging.NLogIntegration-vs2008

REM Remove Rhino Mocks Reference
%~dp0..\tools\SolutionTransform\SolutionTransform ModifyProject --solution %~dp0..\Castle.Core-SL.sln --project Castle.DynamicProxy.Tests-SL --removeAssembly Rhino.Mocks.CPP.Interfaces --rename -SL

REM Retarget to Silverlight
%~dp0..\tools\SolutionTransform\SolutionTransform Retarget --solution %~dp0..\Castle.Core-SL.sln --assemblyPaths ..\lib\silverlight-3.0 --target Silverlight30 --outputPaths build\silverlight30 --rename -SL 

REM ***********************************************************
REM Also do VS2010
REM ***********************************************************

%~dp0..\tools\SolutionTransform\SolutionTransform Retarget --solution %~dp0..\Castle.Core-VS2008.sln --assemblyPaths ..\lib\net-4.0 --ide VS2010 --target DotNet40 --outputPaths build\net40 --rename -VS2010

REM Things you need to do now to get it compiling and passing 95% of the tests:
REM    1) Sort out AssemblyInfo.cs
REM    2) Fix InteralsVisibleTo since Silverlight30 doesn't sign assemblies.
REM    3) Remove "treat warnings as errors".  Otherwise, the current silverlight code base doesn't compile.  This isn't done by default, because it's a bad default...

REM Things we need before returned to trunk
REM    1) Integrate into the build system.
REM    2) Clean up all of the various silverlight project files in source and put them into .gitignore.

