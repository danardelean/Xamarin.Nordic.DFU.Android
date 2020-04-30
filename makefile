BUILD_FOLDER=Xamarin.Nordic.DFU.Android
NUGET_FOLDER=../Xamarin.Nordic.DFU.Android.Nuget

NORDIC_VERSION=1.10.1

SOURCE_AAR=Xamarin.Nordic.DFU.Android/dfu.aar

all: build

$(SOURCE_AAR):
	curl -L "https://dl.bintray.com/nordic/android/no/nordicsemi/android/dfu/$(NORDIC_VERSION)/dfu-$(NORDIC_VERSION).aar" -o $(SOURCE_AAR)

build: $(SOURCE_AAR)
	MSBuild $(BUILD_FOLDER)/*.sln -p:Configuration=Release -restore:True -p:PackageOutputPath=$(NUGET_FOLDER) -t:rebuild

clean:
	rm -rf $(NUGET_FOLDER)/*
	MSBuild $(BUILD_FOLDER)/*.sln -t:clean