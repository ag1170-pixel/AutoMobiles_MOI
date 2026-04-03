from django.shortcuts import render, redirect
from django.contrib import messages
from django.core.mail import send_mail
from django.contrib.auth.models import User
from django.conf import settings
from .models import Contact


# Create your views here.
def inquiry(request):
    """Handle car-specific inquiries from car detail pages"""
    if request.method == 'POST':
        try:
            car_id = request.POST.get('car_id', '')
            car_title = request.POST.get('car_title', '')
            first_name = request.POST.get('first_name', '')
            last_name = request.POST.get('last_name', '')
            customer_need = request.POST.get('customer_need', '')
            city = request.POST.get('city', '')
            state = request.POST.get('state', '')
            email = request.POST.get('email', '')
            phone = request.POST.get('phone', '')
            message = request.POST.get('message', '')

            # Create contact entry for car inquiry
            contact = Contact(
                car_id=car_id or None,
                car_title=car_title,
                first_name=first_name,
                last_name=last_name,
                customer_need=customer_need,
                city=city,
                state=state,
                email=email,
                phone=phone,
                message=message,
                name=f"{first_name} {last_name}".strip(),
                subject=f"Inquiry about {car_title}" if car_title else "Car Inquiry",
                contact_type='car_inquiry'
            )
            contact.save()
            messages.success(request, 'Your car inquiry has been submitted, we will get back to you shortly.')
            return redirect('/cars/'+str(car_id) if car_id else '/')
            
        except Exception as e:
            messages.error(request, 'There was an error submitting your inquiry. Please try again.')
            return redirect(request.META.get('HTTP_REFERER', '/'))

def contact_form(request):
    """Handle general contact form submissions"""
    if request.method == 'POST':
        try:
            name = request.POST.get('name', '').strip()
            email = request.POST.get('email', '').strip()
            subject = request.POST.get('subject', '').strip()
            phone = request.POST.get('phone', '').strip()
            message = request.POST.get('message', '').strip()

            # Validation
            if not name or not email or not subject or not message:
                messages.error(request, 'Please fill in all required fields.')
                return redirect('contact')

            # Create contact entry
            contact = Contact(
                name=name,
                email=email,
                subject=subject,
                phone=phone,
                message=message,
                contact_type='general'
            )
            contact.save()

            # Send email to admin (if email settings are configured)
            try:
                admin_info = User.objects.filter(is_superuser=True).first()
                if admin_info and hasattr(settings, 'EMAIL_HOST'):
                    email_subject = f'New Contact Form Submission: {subject}'
                    email_body = f'''
                    Name: {name}
                    Email: {email}
                    Phone: {phone}
                    Message: {message}
                    '''
                    
                    send_mail(
                        email_subject,
                        email_body,
                        settings.DEFAULT_FROM_EMAIL if hasattr(settings, 'DEFAULT_FROM_EMAIL') else email,
                        [admin_info.email],
                        fail_silently=False,
                    )
            except Exception as email_error:
                # Log email error but don't fail the submission
                print(f"Email sending failed: {email_error}")

            messages.success(request, 'Thank you for contacting us. We will get back to you shortly!')
            return redirect('contact')
            
        except Exception as e:
            messages.error(request, 'There was an error submitting your message. Please try again.')
            return redirect('contact')
    
    return redirect('contact')
