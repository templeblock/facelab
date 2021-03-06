### OpenCV

### OpenCV
if(ANDROID)
  message("ANDROID =====================================================================")
  include(SetOpenCVCMakeArgs-android) 
  set_opencv_cmake_args_android()
elseif(is_ios)
  message("is_ios ======================================================================")
  include(SetOpenCVCMakeArgs-iOS) 
  set_opencv_cmake_args_ios()
elseif(APPLE) 
  message("APPLE =======================================================================")
  include(SetOpenCVCMakeArgs-osx)
  set_opencv_cmake_args_osx()
elseif(${is_linux})
  message("is_linux =======================================================================")
  include(SetOpenCVCMakeArgs-nix) 
  set_opencv_cmake_args_nix()
elseif(${is_msvc})
  message("is_msvc=========================================================================")
  include(SetOpenCVCMakeArgs-windows) 
  set_opencv_cmake_args_windows()
endif()


list(APPEND OPENCV_CMAKE_ARGS 
  BUILD_opencv_world=ON 
  BUILD_EIGEN=OFF

  )

if(NOT ${is_msvc})
  list(APPEND OPENCV_CMAKE_ARGS
    CMAKE_CXX_FLAGS="-Wno-c++11-narrowing"
    )
endif()

hunter_config(OpenCV VERSION ${HUNTER_OpenCV_VERSION} CMAKE_ARGS "${OPENCV_CMAKE_ARGS}")
