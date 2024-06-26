from .models import *
from rest_framework import serializers
from admin.authentication.user.models import *
from admin.personal_data.serializers import *
from admin.authentication.user.serializers import *


class AppointmentScheduleSerializer(serializers.ModelSerializer):
    class Meta:
        model = AppointmentSchedule
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class AwardsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Awards
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class BoardSerializer(serializers.ModelSerializer):
    class Meta:
        model = Board
        fields = '__all__'


class DoctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = DoctorProfile
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance


class DoctorUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = 'user_name', 'email',

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class EducationSerializer(serializers.ModelSerializer):
    board = serializers.CharField(source='board.name')  # Serialize the board's name

    class Meta:
        model = Education
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class EducationEditSerializer(serializers.ModelSerializer):
    class Meta:
        model = Education
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class OffDaySerializer(serializers.ModelSerializer):
    class Meta:
        model = OffDay
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class SocialMediaSerializer(serializers.ModelSerializer):
    class Meta:
        model = SocialMedia
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class ScheduleTimeSerializer(serializers.ModelSerializer):
    class Meta:
        model = ScheduleTime
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class DoctorNameDepartmentSerializer(serializers.ModelSerializer):
    department = serializers.CharField(source='department.name', required=False)

    class Meta:
        model = DoctorProfile
        fields = 'id', 'full_name', 'department'


class DoctorSocialSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(source='user.email')
    social_media = SocialMediaSerializer(many=True)
    images = ImageSerializer(source='user.images', many=True)

    class Meta:
        model = DoctorProfile
        fields = 'full_name', 'father_name', 'mother_name', 'email', 'phone_no', 'images', 'social_media'


class DoctorAwardSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(source='user.email')
    awards = AwardsSerializer(many=True)
    images = ImageSerializer(source='user.images', many=True)

    class Meta:
        model = DoctorProfile
        fields = 'full_name', 'father_name', 'mother_name', 'email', 'phone_no', 'images', 'awards'


class DoctorEduSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(source='user.email')
    education = EducationSerializer(many=True)
    images = ImageSerializer(source='user.images', many=True)

    class Meta:
        model = DoctorProfile
        fields = 'full_name', 'father_name', 'mother_name', 'email', 'phone_no', 'images', 'education'


class DoctorWorkingSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(source='user.email')
    off_days = OffDaySerializer(many=True)
    schedule_times = serializers.SerializerMethodField()
    off_day_names = serializers.SerializerMethodField()
    images = ImageSerializer(source='user.images', many=True)
    appointment_schedules = AppointmentScheduleSerializer(many=True)

    class Meta:
        model = DoctorProfile
        fields = 'full_name', 'father_name', 'mother_name', 'email', 'phone_no', 'images', 'appointment_schedules', 'schedule_times', 'off_days', 'off_day_names'

    def get_schedule_times(self, obj):
        schedule_times = []
        for appointment_schedule in obj.appointment_schedules.all():
            schedule_times.extend(appointment_schedule.schedule_time.all())
        return ScheduleTimeSerializer(schedule_times, many=True).data

    def get_off_day_names(self, obj):
        off_day_names = [off_day.off_day.name for off_day in obj.off_days.all()]
        return off_day_names


class DoctorViewSerializer(serializers.ModelSerializer):
    blood_group = serializers.CharField(source='blood_group.name')
    department = serializers.CharField(source='department.name', required=False)
    email = serializers.EmailField(source='user.email')
    gender = serializers.CharField(source='gender.name')
    images = ImageSerializer(source='user.images', many=True)
    matrimony = serializers.CharField(source='matrimony.name')
    present_address = PresentAddressAllSerializer(source='user.present_address', many=True)
    permanent_address = PermanentAddressAllSerializer(source='user.permanent_address', many=True)
    religion = serializers.CharField(source='religion.name')
    user_name = serializers.CharField(source='user.user_name')

    class Meta:
        model = DoctorProfile
        fields = '__all__'


class DoctorPrescriptionSerializer(serializers.ModelSerializer):
    department = serializers.CharField(source='department.name', required=False)
    email = serializers.EmailField(source='user.email')

    class Meta:
        model = DoctorProfile
        fields = '__all__'


class DoctorViewForLandingSerializer(serializers.ModelSerializer):
    awards = AwardsSerializer(many=True)
    appointment_schedules = AppointmentScheduleSerializer(many=True)
    blood_group = serializers.CharField(source='blood_group.name')
    department = serializers.CharField(source='department.name', required=False)
    email = serializers.EmailField(source='user.email')
    education = EducationSerializer(many=True)
    gender = serializers.CharField(source='gender.name')
    images = ImageSerializer(source='user.images', many=True)
    matrimony = serializers.CharField(source='matrimony.name')
    present_address = PresentAddressAllSerializer(source='user.present_address', many=True)
    permanent_address = PermanentAddressAllSerializer(source='user.permanent_address', many=True)
    religion = serializers.CharField(source='religion.name')
    social_media = SocialMediaSerializer(many=True)
    user_name = serializers.CharField(source='user.user_name')

    schedule_times = serializers.SerializerMethodField()
    off_days = OffDaySerializer(many=True)
    off_day_names = serializers.SerializerMethodField()

    class Meta:
        model = DoctorProfile
        fields = '__all__'

    def get_schedule_times(self, obj):
        schedule_times = []
        for appointment_schedule in obj.appointment_schedules.all():
            schedule_times.extend(appointment_schedule.schedule_time.all())
        return ScheduleTimeSerializer(schedule_times, many=True).data

    def get_off_day_names(self, obj):
        off_day_names = [off_day.off_day.name for off_day in obj.off_days.all()]
        return off_day_names


class OffDayIDSerializer(serializers.ModelSerializer):
    class Meta:
        model = OffDay
        fields = 'off_day'


class ChamberSerializer(serializers.ModelSerializer):
    class Meta:
        model = Chamber
        fields = '__all__'


class DoctorChamberSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(source='user.email')
    chamber = ChamberSerializer(many=True)
    images = ImageSerializer(source='user.images', many=True)

    class Meta:
        model = DoctorProfile
        fields = 'full_name', 'father_name', 'mother_name', 'email', 'phone_no', 'images', 'chamber'
