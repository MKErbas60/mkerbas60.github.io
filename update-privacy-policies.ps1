param([switch]$Apply)

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$mobile = (Resolve-Path -LiteralPath (Join-Path $root '../../../mobil/applications')).Path
$descriptions = @{
  bm = @('Block Master', 'game progress and settings stored on the device', 'Google AdMob advertising and its device identifiers', 'gameplay and advertising')
  bwp = @('Block Wood Puzzle', 'game progress, scores and settings', 'advertising services described in the Turkish policy', 'gameplay and advertising')
  canliradio = @('Canlı Radyo', 'station choices, favorites and playback settings', 'radio stream providers and advertising services described in the Turkish policy', 'radio playback and advertising')
  ev = @('Ezan Vakti Pro', 'location or selected city and prayer settings', 'prayer time and advertising services described in the Turkish policy', 'prayer times and notifications')
  ezan_vakti = @('Troya Ezan Vakti', 'location or selected city and prayer settings', 'prayer time and advertising services described in the Turkish policy', 'prayer times and notifications')
  troya_ezan_vakti = @('Troya Ezan Vakti', 'location or selected city and prayer settings', 'prayer time and advertising services described in the Turkish policy', 'prayer times and notifications')
  gys = @('Troya GYS Sınav Hazırlık', 'starred questions, notes, exam history and daily goals stored locally', 'Google AdMob advertising', 'exam preparation and study reminders')
  kpss = @('Troya KPSS Sınav Hazırlık', 'starred questions, notes, exam history and daily goals stored locally', 'Google AdMob advertising', 'exam preparation and study reminders')
  yks = @('Troya YKS Sınav Hazırlık', 'starred questions, notes, exam history and daily goals stored locally', 'Google AdMob advertising', 'exam preparation and study reminders')
  mm = @('Match Master', 'game progress and settings stored on the device', 'Google AdMob advertising and its device identifiers', 'gameplay and advertising')
  sa = @('Troya Sağlık Asistanı', 'health entries and preferences described in the Turkish policy', 'health-related services and advertising described in the Turkish policy', 'health features and reminders')
  saglik_asistani = @('Troya Sağlık Asistanı', 'health entries and preferences described in the Turkish policy', 'health-related services and advertising described in the Turkish policy', 'health features and reminders')
  tdc = @('Troya Dil Çeviri', 'text submitted for translation, translation history and settings', 'translation and advertising services described in the Turkish policy', 'translation and related features')
  troya_dil_ceviri = @('Troya Dil Çeviri', 'text submitted for translation, translation history and settings', 'translation and advertising services described in the Turkish policy', 'translation and related features')
}
$published = Get-ChildItem -LiteralPath $root -Recurse -File -Filter '*privacy-policy*.html' | Where-Object { $_.Directory.Parent.FullName -eq $root }
$local = @(
  'canli_radio/Documents', 'canli_radio/docs', 'troya_ezan_vakti/Documents',
  'troya_dil_ceviri/assets', 'troya_dil_ceviri/documents',
  'troya_gys_sinav/docs', 'troya_kpss_sinav/docs', 'troya_yks_sinav/docs',
  'troya_saglik_asistani/assets/privacy-policy'
)
$files = @($published)
foreach ($relative in $local) {
  $dir = Join-Path $mobile $relative
  if (Test-Path -LiteralPath $dir) {
    $files += Get-ChildItem -LiteralPath $dir -File -Filter '*privacy-policy*.html'
  }
}
$encoding = New-Object System.Text.UTF8Encoding($false)
foreach ($file in $files) {
  $project = if ($file.FullName.StartsWith($root)) { $file.Directory.Name } else { ($file.FullName.Substring($mobile.Length + 1) -split '[\\/]')[0] }
  $key = switch ($project) {
    'canli_radio' { 'canliradio' }
    'troya_gys_sinav' { 'gys' }
    'troya_kpss_sinav' { 'kpss' }
    'troya_yks_sinav' { 'yks' }
    'troya_ezan_vakti' { 'troya_ezan_vakti' }
    'troya_dil_ceviri' { 'troya_dil_ceviri' }
    'troya_saglik_asistani' { 'saglik_asistani' }
    default { $project }
  }
  if (-not $descriptions.ContainsKey($key)) { continue }
  $v = $descriptions[$key]
  $html = [IO.File]::ReadAllText($file.FullName)
  if ($html -match 'id="english-policy-2026"') { continue }
  $name = [System.Net.WebUtility]::HtmlEncode($v[0])
  $data = [System.Net.WebUtility]::HtmlEncode($v[1])
  $third = [System.Net.WebUtility]::HtmlEncode($v[2])
  $purpose = [System.Net.WebUtility]::HtmlEncode($v[3])
  $english = @"
<section id="english-policy-2026" lang="en" style="max-width:900px;margin:2rem auto;padding:1.5rem;background:#fff;color:#222;line-height:1.65">
  <h1>Privacy Policy — $name</h1>
  <p><strong>Last updated:</strong> 10 October 2026. <a href="#top">Türkçe bölüme dön / Back to Turkish</a></p>
  <h2>Scope and information</h2>
  <p>This English section explains the privacy practices of $name. The app uses $data for $purpose. Some information is stored on your device; information sent to third-party services is handled under those services' policies. Use of an optional feature may require the relevant device permission.</p>
  <h2>Third parties and permissions</h2>
  <p>The app may use $third. Third parties may process technical information such as device or advertising identifiers, network information and usage data where their services are active. The Turkish section above lists app-specific permissions and features. Permission access can be managed in your device settings; advertising choices, where offered, can be managed through the app.</p>
  <h2>Storage, deletion and security</h2>
  <p>Locally stored information remains on the device until removed through the app or device controls. Third-party retention and deletion follow the provider's terms. No method of electronic storage or transmission is completely secure.</p>
  <h2>Children and your choices</h2>
  <p>Children should use the app with a parent or guardian where appropriate. You can review device permissions, advertising choices and locally stored information. For questions or requests about your data, contact the developer using the address below.</p>
  <h2>Changes and contact</h2>
  <p>Changes to this policy will be published on this page. Contact: <a href="mailto:mkerbas60@gmail.com">mkerbas60@gmail.com</a>.</p>
</section>
"@
  if ($html -match '<body[^>]*>') { $html = [regex]::Replace($html, '<body([^>]*)>', '<body$1><a id="top"></a>', 1) }
  if ($html -notmatch 'href="#english-policy-2026"') {
    $html = [regex]::Replace($html, '(<body[^>]*>)', '$1<nav style="padding:1rem;text-align:center"><a href="#english-policy-2026">English privacy policy</a></nav>', 1)
  }
  $html = [regex]::Replace($html, '</body>', "$english`n</body>", 1, [TimeSpan]::FromSeconds(2))
  if ($Apply) { [IO.File]::WriteAllText($file.FullName, $html, $encoding) }
  Write-Output $file.FullName
}
