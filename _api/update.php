<html>
<head>
<script>
window.open('/', '_blank');
</script>
</head>
<body>
<pre>
<?php print(shell_exec( '/var/www/kb/_api/pull_kb.sh 2>&1; echo $?')) ?>
<pre>
</body>
</html>
