//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//
import Foundation

extension TestVectors {
    
    static var base32hexJSONObject: Any {
        return [
            [
                "name": "0 bytes",
                "decoded": "",
                "encoded": ""
            ],
            [
                "name": "1 bytes",
                "decoded": "1",
                "encoded": "64======"
            ],
            [
                "name": "2 bytes",
                "decoded": "12",
                "encoded": "64P0===="
            ],
            [
                "name": "3 bytes",
                "decoded": "123",
                "encoded": "64P36==="
            ],
            [
                "name": "4 bytes",
                "decoded": "1234",
                "encoded": "64P36D0="
            ],
            [
                "name": "5 bytes",
                "decoded": "12345",
                "encoded": "64P36D1L"
            ],
            [
                "name": "6 bytes",
                "decoded": "123456",
                "encoded": "64P36D1L6O======"
            ],
            [
                "name": "10 bytes",
                "decoded": "1234567890",
                "encoded": "64P36D1L6ORJGE9G"
            ],
            [
                "name": "15 bytes",
                "decoded": "123451234512345",
                "encoded": "64P36D1L64P36D1L64P36D1L"
            ],
            [
                "name": "RFC4648 Test Vector 1",
                "decoded": "foo",
                "encoded": "CPNMU==="
            ],
            [
                "name": "RFC4648 Test Vector 2",
                "decoded": "foob",
                "encoded": "CPNMUOG="
            ],
            [
                "name": "RFC4648 Test Vector 3",
                "decoded": "fooba",
                "encoded": "CPNMUOJ1"
            ],
            [
                "name": "RFC4648 Test Vector 4",
                "decoded": "foobar",
                "encoded": "CPNMUOJ1E8======"
            ],
            [
                "name": "short phrase",
                "decoded": "THIS IS THE HOUSE THAT JACK BUILT",
                "encoded": "AH44IKP0959I0L288KG4GJQLAD2I0L2885A20II18D5I0GIL95658==="
            ],
            [
                "name": "longer phrase",
                "decoded": "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                "encoded": "9HNN4PBD41KN0SRLDKG68RRCDTP20SR9EGG62RB5EGM20ORFDPPMAORKCLQ7ASH0C5I6IS39EDKM6QBECSG6AR39EGM20SR5CGG68RP0CLKNASRDDTI20T35DLO6USH0D5N66QB4D5I7ARJK41QN883CC5H6USJ541IN8834DTM6USJ541MM2PREC4G62R39E5QM2BH0ALQ20PBED5MI0OB441MMIRJ9DKG7CPBED5GMQB10E5QMISP0DPNN6T3IELI20PBOCLP66QBKC5Q6IRRE41QMOR31DLHMU83CC5H6USJ9ECG6SQBJD4G7AT10C5M6ISBLD5O20PBO41IM2833DTMMQRR4DSG66RREEDIN2TB1EGN20H3LD5PI0OBLEHII0QBIELP6A834DTM6USH0D5N20SJ5E1P6AQ35DPI6ASJ9EGG6IRH0EPNMOTBGEHGN8P90EPIMOQBK41IN6SR541HMIR3CELMI0P3FDHNN4P90CLQI0PJLCTKM2T10DPQMOR3141O62SJ9C5Q7ASHE412NGOR5E1Q6ATBI41PMIRJK41NM6OR1CLHM2T10CDQN0QB4C5Q62T10DPNMS83GE9NMIP35DPQ2O83JELN78839DOG66TBCE1GI0SBLD4G6UPJ6D5HMIO90CHIN6PBIELN7883DDTM6OQBK41GMSQBD41KM8835EDQ20R31C9NN4TBD"
                
            ]
        ]
        
    }
}
