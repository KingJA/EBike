(function() {

    var scripts = document.getElementsByTagName('script'),
        localhostTests = [
            /^localhost$/,
            /\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(:\d{1,5})?\b/ // IP v4
        ],
        host = window.location.hostname,
        isDevelopment = null,
        queryString = window.location.search,
        test, path, i, ln, scriptSrc, match;

    for (i = 0, ln = scripts.length; i < ln; i++) {
        scriptSrc = scripts[i].src;

        match = scriptSrc.match(/bootstrap\.js$/);

        if (match) {
            path = scriptSrc.substring(0, scriptSrc.length - match[0].length);
            break;
        }
    }

    if (queryString.match('(\\?|&)debug') !== null) {
        isDevelopment = true;
    }
    else if (queryString.match('(\\?|&)nodebug') !== null) {
        isDevelopment = false;
    }

    if (isDevelopment === null) {
        for (i = 0, ln = localhostTests.length; i < ln; i++) {
            test = localhostTests[i];

            if (host.search(test) !== -1) {
                isDevelopment = true;
                break;
            }
        }
    }

    if (isDevelopment === null && window.location.protocol === 'file:') {
        isDevelopment = true;
    }

    path = path.replace("common/js/","");//http://localhost:8081/
    // BEGIN CORE PLUGINS 
    //<!--[if lt IE 9]>
    //<script src="assets/plugins/respond.min.js"></script>
    //<script src="assets/plugins/excanvas.min.js"></script> 
    //<![endif]-->
    //document.write('<script type="text/javascript" src="' + path + 'assets/plugins/jquery-1.11.0.min.js"></script>');
    document.write('<script type="text/javascript" src="' + path + 'assets/plugins/jquery-migrate-1.2.1.min.js"></script>');
    //<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
    //document.write('<script type="text/javascript" src="' + path + 'assets/scripts/custom/components-form-tools.js"></script>');
    document.write('<script type="text/javascript" src="' + path + 'assets/plugins/bootstrap/js/bootstrap.min.js"></script>');
    document.write('<script type="text/javascript" src="' + path + 'assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"></script>');
    document.write('<script type="text/javascript" src="' + path + 'assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>');
    document.write('<script type="text/javascript" src="' + path + 'assets/plugins/jquery.blockui.min.js"></script>');
    document.write('<script type="text/javascript" src="' + path + 'assets/plugins/jquery.cokie.min.js"></script>');
    document.write('<script type="text/javascript" src="' + path + 'assets/plugins/uniform/jquery.uniform.min.js"></script>');
    //END CORE PLUGINS


})();

