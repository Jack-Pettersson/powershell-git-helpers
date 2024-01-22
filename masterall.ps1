$starthome = (Get-Location).path
$folders = Get-ChildItem -Directory

foreach ($folder in $folders) {
  cd $folder
  $branches = git branch -r
  $branchlist = ($branches -split '\r?\n').Trim()
  if ($branchlist -like "origin/master") {
    git checkout master
    write-host "$folder is now master"
  } elseif ($branchlist -like "origin/main") {
    git checkout main
    write-host "$folder is now main"
  } else {
    write-host -ForegroundColor Red "No master or main branch found for $folder"
  }
  cd $starthome
}