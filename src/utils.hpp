
#include <type_traits>

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



};