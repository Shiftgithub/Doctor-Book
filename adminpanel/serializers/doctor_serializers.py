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
    def get_permanent_division_name(self, obj):
        try:
            address = obj.permanent_addresses.first()
            return address.permanent_division_name if address else None
        except AttributeError:
            return None

    permanent_division_name = serializers.SerializerMethodField()

    def get_permanent_district_name(self, obj):
        try:
            address = obj.permanent_addresses.first()
            return address.permanent_district_name if address else None
        except AttributeError:
            return None

    permanent_district_name = serializers.SerializerMethodField()

    def get_permanent_upazila_name(self, obj):
        try:
            address = obj.permanent_addresses.first()
            return address.permanent_upazila_name if address else None
        except AttributeError:
            return None

    permanent_upazila_name = serializers.SerializerMethodField()

    def get_permanent_village_state(self, obj):
        try:
            address = obj.permanent_addresses.first()
            return address.permanent_village_state if address else None
        except AttributeError:
            return None

    permanent_village_state = serializers.SerializerMethodField()

    def get_permanent_postal_code(self, obj):
        try:
            address = obj.permanent_addresses.first()
            return address.permanent_postal_code if address else None
        except AttributeError:
            return None

    permanent_postal_code = serializers.SerializerMethodField()

    def get_present_division_name(self, obj):
        try:
            address = obj.present_addresses.first()
            return address.present_division.name if address else None
        except AttributeError:
            return None

    present_division_name = serializers.SerializerMethodField()

    def get_present_district_name(self, obj):
        try:
            address = obj.present_addresses.first()
            return address.present_district_name if address else None
        except AttributeError:
            return None

    present_district_name = serializers.SerializerMethodField()

    def get_present_upazila_name(self, obj):
        try:
            address = obj.present_addresses.first()
            return address.present_upazila_name if address else None
        except AttributeError:
            return None

    present_upazila_name = serializers.SerializerMethodField()

    def get_present_village_state(self, obj):
        try:
            address = obj.present_addresses.first()
            return address.present_village_state if address else None
        except AttributeError:
            return None

    present_village_state = serializers.SerializerMethodField()

    def get_present_postal_code(self, obj):
        try:
            address = obj.present_addresses.first()
            return address.present_postal_code if address else None
        except AttributeError:
            return None

    present_postal_code = serializers.SerializerMethodField()

    department = serializers.CharField(source='department.name', required=False)
    blood_group = serializers.CharField(source='blood_group.name')
    gender = serializers.CharField(source='gender.name')
    matrimony = serializers.CharField(source='matrimony.name')
    religion = serializers.CharField(source='religion.name')
    user_name = serializers.CharField(source='user.user_name')
    email = serializers.EmailField(source='user.email')
    images = ImageSerializer(many=True)

    def get_awards_and_honors(self, obj):
        try:
            awards = obj.awards.first()  # Assuming one doctor can have multiple awards
            return awards.awards_and_honors if awards else None
        except AttributeError:
            return None

    awards_and_honors = serializers.SerializerMethodField()

    def get_publications(self, obj):
        try:
            awards = obj.awards.first()  # Assuming one doctor can have multiple awards
            return awards.publications if awards else None
        except AttributeError:
            return None

    publications = serializers.SerializerMethodField()

    def get_memberships(self, obj):
        try:
            awards = obj.awards.first()  # Assuming one doctor can have multiple awards
            return awards.memberships if awards else None
        except AttributeError:
            return None

    memberships = serializers.SerializerMethodField()

    def get_board_certification_number(self, obj):
        try:
            awards = obj.awards.first()  # Assuming one doctor can have multiple awards
            return awards.board_certification_number if awards else None
        except AttributeError:
            return None

    board_certification_number = serializers.SerializerMethodField()

    def get_research_interests(self, obj):
        try:
            awards = obj.awards.first()  # Assuming one doctor can have multiple awards
            return awards.research_interests if awards else None
        except AttributeError:
            return None

    research_interests = serializers.SerializerMethodField()

    def get_appointment_availability(self, obj):
        try:
            availability = obj.availability.first()  # Assuming one doctor can have one availability record
            return availability.appointment_availability if availability else None
        except AttributeError:
            return None

    appointment_availability = serializers.SerializerMethodField()

    def get_accepting_new_patients(self, obj):
        try:
            availability = obj.availability.first()  # Assuming one doctor can have one availability record
            return availability.accepting_new_patients if availability else None
        except AttributeError:
            return None

    accepting_new_patients = serializers.SerializerMethodField()

    def get_average_wait_time(self, obj):
        try:
            availability = obj.availability.first()  # Assuming one doctor can have one availability record
            return availability.average_wait_time if availability else None
        except AttributeError:
            return None

    average_wait_time = serializers.SerializerMethodField()

    def get_consultation_fee(self, obj):
        try:
            availability = obj.availability.first()  # Assuming one doctor can have one availability record
            return availability.consultation_fee if availability else None
        except AttributeError:
            return None

    consultation_fee = serializers.SerializerMethodField()

    def get_available_facilities(self, obj):
        try:
            availability = obj.availability.first()  # Assuming one doctor can have one availability record
            return availability.available_facilities if availability else None
        except AttributeError:
            return None

    available_facilities = serializers.SerializerMethodField()

    def get_treatments(self, obj):
        try:
            services = obj.services.first()  # Assuming one doctor can have one services record
            return services.treatments if services else None
        except AttributeError:
            return None

    treatments = serializers.SerializerMethodField()

    def get_procedures(self, obj):
        try:
            services = obj.services.first()  # Assuming one doctor can have one services record
            return services.procedures if services else None
        except AttributeError:
            return None

    procedures = serializers.SerializerMethodField()

    def get_hours(self, obj):
        try:
            services = obj.services.first()  # Assuming one doctor can have one services record
            return services.hours if services else None
        except AttributeError:
            return None

    hours = serializers.SerializerMethodField()

    def get_location(self, obj):
        try:
            services = obj.services.first()  # Assuming one doctor can have one services record
            return services.location if services else None
        except AttributeError:
            return None

    location = serializers.SerializerMethodField()

    def get_website(self, obj):
        try:
            social_media = obj.social_media.first()  # Assuming one doctor can have one social media record
            return social_media.website if social_media else None
        except AttributeError:
            return None

    website = serializers.SerializerMethodField()

    def get_facebook(self, obj):
        try:
            social_media = obj.social_media.first()  # Assuming one doctor can have one social media record
            return social_media.facebook if social_media else None
        except AttributeError:
            return None

    facebook = serializers.SerializerMethodField()

    def get_instagram(self, obj):
        try:
            social_media = obj.social_media.first()  # Assuming one doctor can have one social media record
            return social_media.instagram if social_media else None
        except AttributeError:
            return None

    instagram = serializers.SerializerMethodField()

    def get_linkedin(self, obj):
        try:
            social_media = obj.social_media.first()  # Assuming one doctor can have one social media record
            return social_media.linkedin if social_media else None
        except AttributeError:
            return None

    linkedin = serializers.SerializerMethodField()

    class Meta:
        model = Doctor_Profile
        fields = [
            'id', 'full_name', 'father_name', 'mother_name', 'date_of_birth', 'nid_no', 'phone_no', 'experience',
            'biography', 'languages_spoken', 'passport_no', 'department', 'blood_group', 'gender', 'matrimony',
            'religion', 'user_name', 'email', 'images', 'permanent_village_state', 'permanent_postal_code',
            'permanent_division_name', 'permanent_district_name', 'permanent_upazila_name',
            'present_village_state', 'present_postal_code', 'present_division_name', 'present_district_name',
            'present_upazila_name', 'awards_and_honors', 'publications', 'memberships', 'board_certification_number',
            'research_interests', 'appointment_availability', 'accepting_new_patients', 'average_wait_time',
            'consultation_fee', 'available_facilities', 'treatments', 'procedures', 'hours', 'location', 'website',
            'facebook', 'instagram', 'linkedin'
        ]
