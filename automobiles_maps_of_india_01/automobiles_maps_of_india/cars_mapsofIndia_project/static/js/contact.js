// Popup functionality for contact form
function showMessageSent() {
    // Get the popup modal
    var popup = document.getElementById('popupModal');
    
    // Show the popup
    popup.style.display = 'block';
    
    // Optional: Clear the form fields after showing the popup
    document.querySelector('form').reset();
    
    // Auto-close popup after 3 seconds
    setTimeout(function() {
        closePopup();
    }, 3000);
}

function closePopup() {
    // Get the popup modal
    var popup = document.getElementById('popupModal');
    
    // Hide the popup
    popup.style.display = 'none';
}

// Close popup when clicking outside of it
window.onclick = function(event) {
    var popup = document.getElementById('popupModal');
    if (event.target == popup) {
        closePopup();
    }
}

// Close popup when pressing Escape key
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        closePopup();
    }
});
