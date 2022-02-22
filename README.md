# SwiftUILibrary

このレポジトリには、私が設計したSwiftUI UI要素がいくつか含まれており、私はそれらを自分のアプリケーションで使用します。

<img width="350" alt="image" src="/social-image.png">

## UI要素

- [`TagsView`](/Sources/SwiftUILibrary/TagsView.swift): 複数のタグとテキストを表示します。`TagView` を使ってタグを1つだけ表示することもできます。

<img width="300" alt="image" src="https://raw.githubusercontent.com/mszmagic/SwiftUILibrary/master/Images/TagsView.png">

- [`SelectableTagView`](/Sources/SwiftUILibrary/SelectableTagView.swift)

<img width="300" alt="image" src="https://raw.githubusercontent.com/mszmagic/SwiftUILibrary/master/Images/SelectableTagView.png">

- [`SearchTextFieldView`](/Sources/SwiftUILibrary/SearchTextFieldView.swift): 検索バーを表示して、ユーザーがテキストを入力し検索できるようにします

<img width="300" alt="image" src="https://raw.githubusercontent.com/mszmagic/SwiftUILibrary/master/Images/SearchTextFieldView.png">

- [`View.addOverlay`](/Sources/SwiftUILibrary/SwiftUIAddOverlay.swift): 既存のビューのオーバーレイとして別のビューをすばやく追加します。これを、あらゆるSwiftUIビュー要素のビューモディファイアとして使用できます。

<img width="300" alt="image" src="https://raw.githubusercontent.com/mszmagic/SwiftUILibrary/master/Images/overlayExample.jpg">

- [`LinkPreview`](/Sources/SwiftUILibrary/LinkPreview.swift):

<img width="300" alt="image" src="https://raw.githubusercontent.com/mszmagic/SwiftUILibrary/master/Images/LinkPreview.png">

- [`RoundedButton`](/Sources/SwiftUILibrary/roundedButton.swift) /  [`BigRoundedButton`](/Sources/SwiftUILibrary/BigRoundedButton.swift): アイコン付きの丸いボタンの表示。

<img width="300" alt="image" src="https://raw.githubusercontent.com/mszmagic/SwiftUILibrary/master/Images/roundedButton.png">

<img width="300" alt="image" src="https://raw.githubusercontent.com/mszmagic/SwiftUILibrary/master/Images/BigRoundedButton.png">

- [`HorizontalListCell`](/Sources/SwiftUILibrary/HorizontalListCell.swift): ​タイトル、サブタイトル、画像、その他のコンポーネントを含む水平表示。

<img width="300" alt="image" src="https://raw.githubusercontent.com/mszmagic/SwiftUILibrary/master/Images/HorizontalListCell.png">

- [`HorizontalBasicInfo`](/Sources/SwiftUILibrary/HorizontalBasicInfo.swift): 左側にタイトル、右側に詳細値を含む水平表示。

- [`RoundedIconDisplay`](/Sources/SwiftUILibrary/RoundedIconDisplay.swift): 角丸画像を表示

<img width="300" alt="image" src="https://raw.githubusercontent.com/mszmagic/SwiftUILibrary/master/Images/RoundedIconDisplay.png">

- [`roundedButtonWithLargeLabels`](/Sources/SwiftUILibrary/roundedButtonWithLargeLabels.swift)

<img width="300" alt="image" src="https://raw.githubusercontent.com/mszmagic/SwiftUILibrary/master/Images/roundedButtonWithLargeLabels.png">

## インストール方法：

### Swift Package Manager

1. Xcode内からプロジェクトを開く
2. 上部のシステムバーの"File"をクリック
3. "Swift Packages"をクリック、次いで"Add package dependency…"をクリック
4. 以下のURLをペースト：`https://github.com/mszmagic/SwiftUILibrary.git`
5. Version: `Up to Next Major 1.6 <`
6. "Next"をクリック
7. "Done"をクリック。
8. `import SwiftUILibrary`
