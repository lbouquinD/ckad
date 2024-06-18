<!DOCTYPE html>
<html>
<head>
    <title>Pod Information</title>
</head>
<body>
    <h1><center> Je suis le pod: <span id="podName"></span></center></h1>
    <p> Je suis:  NAME </p>
    <p>Chemin actuel : <span id="currentPath"></span></p>
    <script>
        // Récupérez le nom du pod à partir de la variable d'environnement
        var podName = "MY_POD_NAME";

        // Remplacez les tirets par des espaces dans le nom du pod
        podName = podName.replace(/-/g, ' ');

        // Affichez le nom du pod dans le navigateur
        document.getElementById('podName').textContent = podName;

        // Récupérez le chemin de l'URL actuel
        var currentPath = window.location.pathname;

        // Affichez le chemin de l'URL dans le navigateur
        document.getElementById('currentPath').textContent = currentPath;
    </script>
</body>
</html>

