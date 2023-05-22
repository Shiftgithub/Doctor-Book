from django.shortcuts import render


def Index(request):
    return render(request, 'app/index.html')


def StoreDoctorInfo(request):
    if request.method == "POST":
        form = DoctorForm(request.POST)
        if form.is_valid():
            try:
                form.save()
                return redirect('/add/doctor')
            except:
                pass
    else:
        form = DoctorForm()
    return render(request, 'app/doctorform.html', {'form': form})
