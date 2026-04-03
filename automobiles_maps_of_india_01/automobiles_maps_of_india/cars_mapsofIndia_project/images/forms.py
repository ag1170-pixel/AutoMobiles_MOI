from django import forms
from .models import DynamicImage

class DynamicImageForm(forms.ModelForm):
    class Meta:
        model = DynamicImage
        fields = ['name', 'image', 'page_reference', 'alt_text', 'is_active']
        widgets = {
            'name': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Enter image name'
            }),
            'page_reference': forms.Select(attrs={
                'class': 'form-control'
            }),
            'alt_text': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Enter alt text for accessibility'
            }),
            'is_active': forms.CheckboxInput(attrs={
                'class': 'form-check-input'
            }),
            'image': forms.FileInput(attrs={
                'class': 'form-control',
                'accept': 'image/*'
            })
        }
    
    def clean_image(self):
        image = self.cleaned_data.get('image')
        if image:
            # Check file size (max 5MB)
            if image.size > 5 * 1024 * 1024:
                raise forms.ValidationError('Image file size must be less than 5MB')
            
            # Check file extension
            valid_extensions = ['jpg', 'jpeg', 'png', 'gif', 'webp']
            file_extension = image.name.split('.')[-1].lower()
            if file_extension not in valid_extensions:
                raise forms.ValidationError(
                    f'Invalid file extension. Allowed extensions are: {", ".join(valid_extensions)}'
                )
        
        return image
