// Hide page loader immediately
(function() {
    var loader = document.querySelector('.page_loader');
    if (loader) {
        loader.style.display = 'none';
        loader.style.opacity = '0';
        loader.style.visibility = 'hidden';
        loader.style.zIndex = '-9999';
    }
})();

// Failsafe - force hide after 1 second
setTimeout(function() {
    var loader = document.querySelector('.page_loader');
    if (loader) {
        loader.style.display = 'none';
        loader.style.opacity = '0';
        loader.style.visibility = 'hidden';
        loader.remove();
    }
}, 1000);

function showContactInfo(name) {
    alert('Contact information for ' + name + ' will be available soon. Please use our main contact form for immediate assistance.');
}

// Simple smooth scrolling for anchor links
document.addEventListener('DOMContentLoaded', function() {
    var anchors = document.querySelectorAll('a[href^="#"]');
    for (var i = 0; i < anchors.length; i++) {
        anchors[i].addEventListener('click', function(e) {
            e.preventDefault();
            var target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    }
});
