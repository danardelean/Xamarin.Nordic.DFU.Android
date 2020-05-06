BUILD_FOLDER=Xamarin.Nordic.DFU.Android
SOURCE_FOLDER=Xamarin.Nordic.DFU.Android.Source

NORDIC_VERSION=1.11.1

AAR_FILE=Xamarin.Nordic.DFU.Android/Jars/dfu.aar

all: msbuild

$(AAR_DIRECTORY)$(AAR_FILE):
	gradle assembleRelease -p $(SOURCE_FOLDER)
	cp $(SOURCE_FOLDER)/dfu/build/outputs/aar/dfu-release.aar $(AAR_FILE)

msbuild: $(AAR_DIRECTORY)$(AAR_FILE)
ifdef NUGET_FOLDER
	MSBuild $(BUILD_FOLDER)/*.sln -t:Rebuild -restore:True -p:Configuration=Release -p:PackageOutputPath=$(NUGET_FOLDER)
else
	MSBuild $(BUILD_FOLDER)/*.sln -t:Rebuild -restore:True -p:Configuration=Release
endif

clean:
	# Cleaning native outputs
	rm -rf $(SOURCE_FOLDER)/dfu/build/outputs/*
	# Cleaning nuget cache
	rm -rf ~/.nuget/packages/xamarin.nordic.dfu.android
	# Cleaning MSBuild output
	MSBuild $(BUILD_FOLDER)/*.sln -t:clean
