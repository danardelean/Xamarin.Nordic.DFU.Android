# Xamarin binding library for Nordic Android DFU

This is an Xamarin binding library for the Nordic Semiconductors Android library for updating the firmware of their devices over the air via Bluetooth Low Energy. The Java library is located here: https://github.com/NordicSemiconductor/Android-DFU-Library

## BUILD

To generate the package, run:

```bash
make [NORDIC_VERSION=Desired version]
```

and you'll find your nuget in the `Xamarin.Nordic.DFU.Android.Nuget` folder.
