$starthome = (Get-Location).path
$folders = Get-ChildItem -Directory

foreach ($folder in $folders) {
  cd $folder
  git status
  cd $starthome
}