{ lib
, buildPythonPackage
, fetchPypi
, setuptools-scm
, adafruit-pureio
}:

buildPythonPackage rec {
  pname = "Adafruit-Blinka";
  version = "8.2.0";

  src = fetchPypi {
    pname = "Adafruit-Blinka";
    inherit version;
    sha256 = "sha256-PM2oBr3yrSeuzKxEZpmkE3zmftoI1/jBmEz+ijIQ7Hg=";
  };

  propagatedBuildInputs = [
    adafruit-pureio  
  ];

  nativeBuildInputs = [ setuptools-scm ];

  # Physical SMBus is not present
  doCheck = false;
  pythonImportsCheck = [ "boards" ];

  meta = with lib; {
    description = "Add CircuitPython hardware API and libraries to MicroPython & CPython devices";
    homepage = "https://github.com/adafruit/Adafruit_Blinka";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ _2gn ];
  };
}
