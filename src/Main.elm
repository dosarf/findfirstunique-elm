module Main exposing (main)

import Browser
import Css exposing (Color, border3, borderColor, borderRadius, display, height, hex, hover, inlineBlock, padding, px, rgb, solid, width)
import Html.Styled exposing (Html, div, header, img, main_, text, toUnstyled)
import Html.Styled.Attributes exposing (css, src)
import Mwc.Button
import Mwc.TextField


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


{-| A plain old record holding a couple of theme colors.
-}
theme : { secondary : Color, primary : Color }
theme =
    { primary = hex "55af6a"
    , secondary = rgb 250 240 230
    }


{-| A logo image, with inline styles that change on hover.
-}
logo : Html msg
logo =
    img
        [ src "assets/free-logo.png"
        , css
            [ display inlineBlock
            , height (px 53)
            , width (px 128)
            , padding (px 20)
            , border3 (px 5) solid (rgb 120 120 120)
            , hover
                [ borderColor theme.primary
                , borderRadius (px 10)
                ]
            ]
        ]
        []


view : Model -> Html Msg
view model =
    main_ []
        [ header
            []
            [ div
                []
                [ logo ]
            , div
                []
                [ text "Inc- and decrement a number" ]
            ]
        , div
            [ css [ width (px 300) ] ]
            [ Mwc.TextField.view [ Mwc.TextField.readonly True, Mwc.TextField.label <| String.fromInt model.count ]
            , Mwc.Button.view [ Mwc.Button.raised, Mwc.Button.onClick Increment, Mwc.Button.label "increment" ]
            , Mwc.Button.view [ Mwc.Button.raised, Mwc.Button.onClick Decrement, Mwc.Button.label "decrement" ]
            ]
        ]


main =
    Browser.sandbox
        { init = initialModel
        , view = view >> toUnstyled
        , update = update
        }
