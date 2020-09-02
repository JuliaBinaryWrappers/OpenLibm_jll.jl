# Autogenerated wrapper script for OpenLibm_jll for x86_64-w64-mingw32
export libopenlibm

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"
LIBPATH_default = ""

# Relative path to `libopenlibm`
const libopenlibm_splitpath = ["bin", "libopenlibm.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libopenlibm_path = ""

# libopenlibm-specific global declaration
# This will be filled out by __init__()
libopenlibm_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libopenlibm = "libopenlibm.dll"


# Inform that the wrapper is available for this platform
wrapper_available = true

"""
Open all libraries
"""
function __init__()
    # This either calls `@artifact_str()`, or returns a constant string if we're overridden.
    global artifact_dir = find_artifact_dir()

    global PATH_list, LIBPATH_list
    global libopenlibm_path = normpath(joinpath(artifact_dir, libopenlibm_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libopenlibm_handle = dlopen(libopenlibm_path, RTLD_LAZY | RTLD_DEEPBIND)
    push!(LIBPATH_list, dirname(libopenlibm_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(vcat(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ';')

    
end  # __init__()
