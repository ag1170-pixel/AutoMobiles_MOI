// Ensure page loader is hidden immediately
(function() {
    'use strict';
    
    // Hide page loader immediately when DOM is ready
    function hideLoader() {
        var loader = document.querySelector('.page_loader');
        if (loader) {
            loader.style.display = 'none';
            loader.style.opacity = '0';
            loader.style.visibility = 'hidden';
        }
    }
    
    // Multiple fallback mechanisms
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', hideLoader);
    } else {
        hideLoader();
    }
    
    // jQuery fallback
    if (window.jQuery) {
        jQuery(document).ready(function() {
            jQuery('.page_loader').fadeOut(200, function() {
                jQuery(this).hide();
            });
        });
    }
    
    // Window load fallback
    window.addEventListener('load', hideLoader);
    
    // Timeout fallback - force hide after 3 seconds
    setTimeout(hideLoader, 3000);
})();
