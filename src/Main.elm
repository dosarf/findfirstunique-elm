module Main exposing (main)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Mwc.Button


type alias Model =
    { count : Int }


initialModel : Model
initialModel =
    { count = 0 }


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }

        Decrement ->
            { model | count = model.count - 1 }


{-| A logo image, with inline styles that change on hover.
-}
logo : Html msg
logo =
    img
        [ src "logo.png"
        , css
            [ display inlineBlock
            , padding (px 20)
            , border3 (px 5) solid (rgb 120 120 120)
            , hover
                [ borderColor theme.primary
                , borderRadius (px 10)
                ]
            ]
        ]
        []


{-| A plain old record holding a couple of theme colors.
-}
theme : { secondary : Color, primary : Color }
theme =
    { primary = hex "55af6a"
    , secondary = rgb 250 240 230
    }


{-| A reusable button which has some styles pre-applied to it.
-}
btn : List (Attribute msg) -> List (Html msg) -> Html msg
btn =
    styled button
        [ margin (px 12)
        , color (rgb 250 250 250)
        , hover
            [ backgroundColor theme.primary
            , textDecoration underline
            ]
        ]


{-| A reusable style. Css.batch combines multiple styles into one, much
like mixins in CSS preprocessors.
-}
paragraphFont : Style
paragraphFont =
    Css.batch
        [ fontFamilies [ "Palatino Linotype", "Georgia", "serif" ]
        , fontSize (px 16)
        , fontWeight normal
        ]


{-| Css.property lets you define custom properties, using strings as their values.
-}
legacyBorderRadius : String -> Style
legacyBorderRadius amount =
    Css.batch
        [ property "-moz-border-radius" amount
        , property "-webkit-border-top-left-radius" amount
        , property "-webkit-border-top-right-radius" amount
        , property "-webkit-border-bottom-right-radius" amount
        , property "-webkit-border-bottom-left-radius" amount
        , property "border-radius" amount
        ]


view : Model -> Html Msg
view model =
    nav []
        [ img [ src "assets/backdrop.jpg", css [ width (pct 100) ] ] []
        , div [] [ text <| String.fromInt model.count ]
        , btn [ onClick Increment ] [ text "Inc!" ]
        , btn [ onClick Decrement ] [ text "Dec!" ]
        , Mwc.Button.view [ Mwc.Button.raised, Mwc.Button.onClick Decrement, Mwc.Button.label "decrement" ]
        ]


main =
    Browser.sandbox
        { init = initialModel
        , view = view >> toUnstyled
        , update = update
        }