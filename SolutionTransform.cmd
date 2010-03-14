REM ***********************************************************
REM This only works if you execute it in the solution directory
REM ***********************************************************

REM The following creates the Silverlight solution

REM The following removes logging

tools\SolutionTransform\SolutionTransform Modify --solution %CD%\Castle.Core-vs2008.sln --rename -SL --remove Castle.Services.Logging.log4netIntegration-vs2008 Castle.Services.Logging.NLogIntegration-vs2008

REM Remove Rhino Mocks Reference
tools\SolutionTransform\SolutionTransform ModifyProject --solution %CD%\Castle.Core-SL.sln --project Castle.DynamicProxy.Tests-SL --removeAssembly Rhino.Mocks.CPP.Interfaces --rename -SL

REM Retarget to Silverlight
tools\SolutionTransform\SolutionTransform Retarget --solution %CD%\Castle.Core-SL.sln --assemblyPaths ..\lib\silverlight-3.0 --target Silverlight30 --outputPaths build\silverlight30 --rename -SL 

REM Things you need to do now to get it compiling and passing 95% of the tests:
REM    1) Sort out AssemblyInfo.cs
REM    2) Fix InteralsVisibleTo since Silverlight30 doesn't sign assemblies.
REM    3) Remove "treat warnings as errors".  Otherwise, the current silverlight code base doesn't compile.  This isn't done by default, because it's a bad default...

REM Things we need before returned to trunk
REM    1) Integrate into the build system.


