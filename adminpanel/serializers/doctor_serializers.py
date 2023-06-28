from rest_framework import serializers
from adminpanel.models.doctor_models import *


class DoctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctor_Profile
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance


class ImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Images
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance


class PresentAddressSerializer(serializers.ModelSerializer):
    class Meta:
        model = PresentAddress
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class PermanentAddressSerializer(serializers.ModelSerializer):
    class Meta:
        model = PermanentAddress
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class DivisionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Division
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class DistrictSerializer(serializers.ModelSerializer):
    class Meta:
        model = District
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class UpazilaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Upazila
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class MatrimonieSerializer(serializers.ModelSerializer):
    class Meta:
        model = Matrimony
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class ReligionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Religion
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance.pk  # Fetch the primary key of the saved object


class GenderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Gender
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class BloodGroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Blood_Group
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class AvailabilitySerializer(serializers.ModelSerializer):
    class Meta:
        model = Availability
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


class EducationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Education
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class ServicesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Services
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class SocialMediaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Social_Media
        fields = '__all__'

    def create(self, validated_data):
        instance = super().create(validated_data)
        return instance  # Fetch the primary key of the saved object


class DoctorAllDataSerializer(serializers.ModelSerializer):
    specialty = serializers.CharField(source='specialty.name')
    blood_group = serializers.CharField(source='blood_group.name')
    gender = serializers.CharField(source='gender.name')
    matrimony = serializers.CharField(source='matrimony.name')
    religion = serializers.CharField(source='religion.name')
    user_name = serializers.CharField(source='user.user_name')
    email = serializers.EmailField(source='user.email')
    doctor_photos = serializers.CharField(source='images.doctor_photos')
    permanent_village_state = serializers.CharField(source='permanent_addresses.permanent_village_state')
    permanent_division_name = serializers.CharField(source='permanent_addresses.permanent_division.name')
    permanent_district_name = serializers.CharField(source='permanent_addresses.permanent_district.name')
    permanent_upazila_name = serializers.CharField(source='permanent_addresses.permanent_upazila.name')
    present_village_state = serializers.CharField(source='present_addresses.present_village_state')
    present_postal_code = serializers.CharField(source='present_addresses.present_postal_code')
    present_division_name = serializers.CharField(source='present_addresses.present_division.name')
    present_district_name = serializers.CharField(source='present_addresses.present_district.name')
    present_upazila_name = serializers.CharField(source='present_addresses.present_upazila.name')
    awards_and_honors = serializers.CharField(source='awards.awards_and_honors')
    publications = serializers.CharField(source='awards.publications')
    memberships = serializers.CharField(source='awards.memberships')
    board_certification_number = serializers.CharField(source='awards.board_certification_number')
    research_interests = serializers.CharField(source='awards.research_interests')
    appointment_availability = serializers.CharField(source='availability.appointment_availability')
    accepting_new_patients = serializers.BooleanField(source='availability.accepting_new_patients')
    average_wait_time = serializers.CharField(source='availability.average_wait_time')
    consultation_fee = serializers.CharField(source='availability.consultation_fee')
    available_facilities = serializers.CharField(source='availability.available_facilities')
    certificate_degree = serializers.CharField(source='education.certificate_degree')
    institution = serializers.CharField(source='education.institution')
    board = serializers.CharField(source='education.board')
    result = serializers.CharField(source='education.result')
    passing_year = serializers.IntegerField(source='education.passing_year')
    treatments = serializers.CharField(source='services.treatments')
    procedures = serializers.CharField(source='services.procedures')
    hours = serializers.CharField(source='services.hours')
    location = serializers.CharField(source='services.location')
    website = serializers.CharField(source='social_media.website')
    facebook = serializers.CharField(source='social_media.facebook')
    instagram = serializers.CharField(source='social_media.instagram')
    linkedin = serializers.CharField(source='social_media.linkedin')
    twitter = serializers.CharField(source='social_media.twitter')

    class Meta:
        model = Doctor_Profile
        fields = [
            'id', 'full_name', 'father_name', 'mother_name', 'date_of_birth', 'nid_no', 'phone_no', 'experience',
            'biography', 'languages_spoken', 'passport_no', 'specialty', 'blood_group', 'gender', 'matrimony',
            'religion', 'user_name', 'email', 'doctor_photos', 'permanent_village_state', 'permanent_division_name',
            'permanent_district_name', 'permanent_upazila_name', 'present_village_state', 'present_postal_code',
            'present_division_name', 'present_district_name', 'present_upazila_name', 'awards_and_honors',
            'publications', 'memberships', 'board_certification_number', 'research_interests',
            'appointment_availability', 'accepting_new_patients', 'average_wait_time', 'consultation_fee',
            'available_facilities', 'certificate_degree', 'institution', 'board', 'result', 'passing_year',
            'treatments', 'procedures', 'hours', 'location', 'website', 'facebook', 'instagram', 'linkedin', 'twitter'
        ]
