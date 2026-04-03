#
# def add_company(request):
#     if request.method == 'POST':
#         form = CompanyForm(request.POST)
#         if form.is_valid():
#             form.save()
#             return redirect('automobile_companies')
#     else:
#         form = CompanyForm()
#     return render(request, 'add_company.html', {'form': form})