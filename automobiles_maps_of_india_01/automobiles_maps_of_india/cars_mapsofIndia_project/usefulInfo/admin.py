from django.contrib import admin
from .models import Useful,Manufacturer,AutomobileTip,TransmissionSystem,TransmissionTip,RelatedLink
from .models import Article,SuspensionSystem,MotorPolicy,AutomobileInfo,AutomobileInfoSection,InfoArticle


admin.site.register(Useful)
admin.site.register(Manufacturer)
admin.site.register(AutomobileTip)
admin.site.register(TransmissionSystem)
admin.site.register(TransmissionTip)
admin.site.register(Article)
admin.site.register(SuspensionSystem)
admin.site.register(MotorPolicy)
admin.site.register(AutomobileInfo)
admin.site.register(AutomobileInfoSection)
admin.site.register(InfoArticle)
admin.site.register(RelatedLink)
# Register your models here.
