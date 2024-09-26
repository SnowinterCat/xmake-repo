local opts = {
    -- name            description                         default          ver (only work on this version)
    base            = {des = "Build gst-plugin-base.",     default = true},
    good            = {des = "Build gst-plugin-good.",     default = true},
    ugly            = {des = "Build gst-plugin-ugly.",     default = true},
    bad             = {des = "Build gst-plugin-bad.",      default = true},
    libav           = {des = "Build gst-libav.",           default = false, deps = {"ffmpeg"}},
    devtools        = {des = "Build devtools.",            default = false},
    tools           = {des = "Build command line tools.",  default = false, ver = {"1.22"}},
    ges             = {des = "Build ges.",                 default = false},
    libnice         = {des = "ICE support using libnice.", default = false},
    omx             = {des = "Build gst-omx.",             default = false, ver = {"1.20", "1.22"}},
    python          = {des = "Build gst-python.",          default = false},
    qt5             = {des = "Qt5 toolkit support.",       default = false},
    qt6             = {des = "Qt6 toolkit support.",       default = false, ver = {"1.24"}},
    rs              = {des = "Build gst-rs.",              default = false},
    rtsp_server     = {des = "Build gst-rtsp_server.",     default = false},
    sharp           = {des = "Build gst-sharp.",           default = false},
    vaapi           = {des = "Build gst-vaapi.",           default = false},
    webrtc          = {des = "WebRTC support.",            default = false, ver = {"1.24"}},

    introspection   = {des = "Generate introspection data.", default = false},
    gtk_doc         = {des = "Build gtk_doc.",               default = false},
    doc             = {des = "Build documents.",             default = false},
    examples        = {des = "Build examples.",              default = false},
    tests           = {des = "Build tests.",                 default = false},
    -- gst-examples    = {des = "Build gst-examples subproject.", default = false},
    -- glib-asserts        = {des = "Build tools.",        default = "auto", values = {"auto", "enable", "disable"}, type = "string"},
    -- glib-checks         = {des = "Build tools.",        default = "auto", values = {"auto", "enable", "disable"}, type = "string"},
    -- gobject-cast-checks = {des = "Build tools.",        default = "auto", values = {"auto", "enable", "disable"}, type = "string"},

    gpl = {des = "Allow build of plugins that have (A)GPL-licensed dependencies.", default = false},
    nls = {des = "Enable native language support (translations).",                 default = false},
    orc = {des = "Optimized Inner Loop Runtime Compiler (SIMD).",                  default = false},
    tls = {des = "TLS support using glib-networking.",                             default = false}--,
}

local childopts = {
    -- parent_child        meson parent name         description                                     default         deps
    base_gl     = {base = "gst-plugins-base", des = "OpenGL",                                        default = true,  deps = {"opengl", "graphene", "libjpeg", "libpng"}},
    base_ogg    = {base = "gst-plugins-base", des = "ogg parser, muxer, demuxer plugin",             default = true,  deps = {"libogg"}},
    base_opus   = {base = "gst-plugins-base", des = "OPUS audio codec plugin",                       default = true,  deps = {"libopus"}},
    base_pango  = {base = "gst-plugins-base", des = "Pango text rendering and overlay plugin",       default = true,  deps = {"pango"}},
    base_vorbis = {base = "gst-plugins-base", des = "Vorbis audio parser, tagger, and codec plugin", default = true,  deps = {"libvorbis"}},

    good_jpeg   = {base = "gst-plugins-good", des = "JPEG image codec plugin",                  default = true,  deps = {"libjpeg"}},
    good_lame   = {base = "gst-plugins-good", des = "LAME mp3 audio encoder plugin",            default = true,  deps = {"lame"}},
    good_dv     = {base = "gst-plugins-good", des = "Digital video decoder and demuxer plugin", default = false, deps = {"libdv"}},

    ugly_x264   = {base = "gst-plugins-ugly", des = "H.264 video encoder plugin based on libx264 (gpl plugin)", default = false, deps = {"x264"}},

    bad_dash     = {base = "gst-plugins-bad", des = "DASH demuxer plugin",                          default = false, deps = {"libxml2"}},
    bad_fdkaac   = {base = "gst-plugins-bad", des = "Fraunhofer AAC audio codec plugin",            default = false, deps = {"fdk-aac"}},
    bad_iqa      = {base = "gst-plugins-bad", des = "Image quality assessment plugin (gpl plugin)", default = false, deps = {"dssim"}},
    bad_microdns = {base = "gst-plugins-bad", des = "libmicrodns-based device provider",            default = false, deps = {"libmicrodns"}},
    bad_openjpeg = {base = "gst-plugins-bad", des = "JPEG2000 image codec plugin",                  default = false, deps = {"openjpeg"}},
    bad_openh264 = {base = "gst-plugins-bad", des = "H.264 video codec plugin",                     default = false, deps = {"openh264"}},
    bad_vulkan   = {base = "gst-plugins-bad", des = "Vulkan video sink plugin",                     default = false, deps = {"vulkansdk"}},
    bad_x265     = {base = "gst-plugins-bad", des = "HEVC/H.265 video encoder plugin (gpl plugin)", default = false, deps = {"x265"}}--,
}

local gplopts = {"ugly_x264", "bad_iqa", "bad_x265"}


function get_opts()
    return opts
end

function get_child_opts()
    return childopts
end

function get_gpl_opts()
    return gplopts
end