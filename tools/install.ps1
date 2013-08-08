param($installPath, $toolsPath, $package, $project)

$file = Join-Path (Join-Path $toolsPath '..\content') 'chromedriver.exe' | Get-ChildItem

# because the chromedriver.exe is copied to the project root, we have to remove it and add a file-link again
$project.ProjectItems.Item($file.Name).Delete()

$project.ProjectItems.AddFromFile($file.FullName);
$pi = $project.ProjectItems.Item($file.Name);
$pi.Properties.Item("BuildAction").Value = [int]2;
$pi.Properties.Item("CopyToOutputDirectory").Value = [int]2;