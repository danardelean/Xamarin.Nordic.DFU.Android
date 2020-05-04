BUILD_FOLDER=Xamarin.Nordic.DFU.Android
SOURCE_FOLDER=Xamarin.Nordic.DFU.Android.Source
NUGET_FOLDER=Xamarin.Nordic.DFU.Android.Nuget

NORDIC_VERSION=1.11.1

AAR_FILE=Xamarin.Nordic.DFU.Android/Jars/dfu.aar

all: msbuild

$(AAR_DIRECTORY)$(AAR_FILE):
	gradle assembleRelease -p $(SOURCE_FOLDER)
	cp $(SOURCE_FOLDER)/dfu/build/outputs/aar/dfu-release.aar $(AAR_FILE)

msbuild: $(AAR_DIRECTORY)$(AAR_FILE)
	MSBuild $(BUILD_FOLDER)/*.sln -p:Configuration=Release -restore:True -p:PackageOutputPath=../$(NUGET_FOLDER) -t:rebuild

clean:
	# Cleaning repo
	git clean -dfx
	# Cleaning submodule repo
	cd $(SOURCE_FOLDER)
	git clean -dfx
	cd ..
	# Cleaning native outputs
	rm -rf $(SOURCE_FOLDER)/dfu/build/outputs/*
	# Cleaning nuget output
	rm -rf $(NUGET_FOLDER)/*
	# Cleaning nuget cache
	rm -rf ~/.nuget/packages/xamarin.nordic.dfu.android
	# Cleaning MSBuild output
	MSBuild $(BUILD_FOLDER)/*.sln -t:clean
