INCLUDE (CheckIncludeFiles)
INCLUDE (CheckLibraryExists)

FIND_LIBRARY (JPEG_LIB      "jpeg")
IF (JPEG_LIB)
    GET_FILENAME_COMPONENT (JPEG_PATH  ${JPEG_LIB} PATH)
    CHECK_LIBRARY_EXISTS (${JPEG_LIB} "jpeg_start_compress" ${JPEG_PATH} JPEG_FOUND)
    SET (OLD_CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS})
    SET (CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} "-include stdlib.h -include stdio.h")
    CHECK_INCLUDE_FILES ("jpeglib.h" HAVE_JPEGLIB_H)
    SET (CMAKE_REQUIRED_DEFINITIONS ${OLD_CMAKE_REQUIRED_DEFINITIONS})
ENDIF ()

IF (NOT JPEG_LIB OR NOT JPEG_FOUND OR NOT HAVE_JPEGLIB_H)
    MESSAGE (FATAL_ERROR
             "The jpeg library is either not found or is not operational"
             "on the given system")
ENDIF ()
