module FindFirstUniqueTab exposing (Model, Msg, initialModel, update, view)

import Css exposing (px, width)
import Html.Styled exposing (Html, div, text)
import Html.Styled.Attributes exposing (css)


type alias Model =
    { todo : String }


initialModel : Model
initialModel =
    { todo = "TODO" }


type Msg
    = Nop


update : Msg -> Model -> Model
update msg model =
    model


view : Model -> Html Msg
view model =
    div
        [ css [ width (px 300) ] ]
        [ text model.todo ]
