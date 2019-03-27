
#include <type_traits>
#include <memory>
#include <utility>

namespace utils
{

/**
    Utility check allowing to statically assert that variadic arguments are all of the same type.
    Can be used in the following way:

    template <typename ... Ts, typename = all_of_same_type<std::string, Ts ...>>
    void f (Ts const & ... ts)
    {
        // ...
    }
    
    // ...
    f("Hello", ", ", "World!", std::to_string(5));


    @param _Type        the type that all Ts ... must be of, or can implicitly be converted to
    @param ... Ts       the variadic arguments
    @return bool        whether all Ts ... are of type _Type (or can at least be converted to _Type)
*/
template <typename _Type, typename ... Ts>
using all_of_same_type = typename std::enable_if <std::conjunction <std::is_convertible <Ts, _Type> ...>::value>::type;


/**
    Returns the number of variadic arguments passed to the function
    
    @param ... Ts        vardiadic arguments
    @return std::size_t  the number of arguments
*/
template <typename ... Ts>
constexpr std::size_t number_of_arguments (Ts const & ... ts) noexcept
{
    return sizeof (Ts)...;
};


/**
    Replacement for std::make_unique that exists only from C++ onwards

    @param T                        type
    @param ... _Args                the object arguments
    @return std::unqiue_ptr<T>      a smart pointer holding a T object
*/
template <typename T, typename ... _Args>
std::unique_ptr<T> make_unique (_Args && ... args)
{
    return std::unique_ptr<T>( new T(std::forward<_Args>(args)...) );
};


}; // namespace utils