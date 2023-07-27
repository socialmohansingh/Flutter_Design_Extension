import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/utility_widgets/layout/widget_showcase_screen.dart';
import 'package:flutter/material.dart';

class TextFieldsWidgetShowcaseScreen extends StatefulWidget {
  const TextFieldsWidgetShowcaseScreen({super.key});

  @override
  State<TextFieldsWidgetShowcaseScreen> createState() =>
      _TextFieldsWidgetShowcaseScreenState();
}

class _TextFieldsWidgetShowcaseScreenState
    extends State<TextFieldsWidgetShowcaseScreen> {
  late DesignTokensThemeExtension theme;

  @override
  Widget build(BuildContext context) {
    theme = context.theme;

    return WidgetShowcaseScreen(
      title: 'Text Fields',
      alternativeBackgroundColor: theme.colors.neutral.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacings.spacing16,
            vertical: theme.spacings.spacing32,
          ),
          child: Column(
            children: [
              statusesTypes(),
              SizedBox(height: theme.spacings.spacing8),
              suffixes(),
              SizedBox(height: theme.spacings.spacing8),
              activeValidation(),
              SizedBox(height: theme.spacings.spacing8),
              onDemandValidation(),
              SizedBox(height: theme.spacings.spacing8),
              multipleLinesMainText(),
              SizedBox(height: theme.spacings.spacing8),
              multipleLinesBottomBar(),
              SizedBox(height: theme.spacings.spacing8),
              prefixes()
            ],
          ),
        ),
      ),
    );
  }

  final loginTextFieldEditingController = TextEditingController();
  var loginTextFieldStatus =
      DesignTextFieldStatus(statusType: DesignTextFieldStatusType.active);
  final passwordTextFieldEditingController = TextEditingController();
  var passwordTextFieldStatus =
      DesignTextFieldStatus(statusType: DesignTextFieldStatusType.active);

  final onDemandValidationLoginFocusNode = FocusNode();
  final onDemandValidationPasswordFocusNode = FocusNode();
  Widget onDemandValidation() {
    return Column(
      children: [
        Text(
          'On Demand Validation',
          style: theme.textStyles.heading3_500,
        ),
        DesignTextField(
          placeholderText: 'Login',
          status: loginTextFieldStatus,
          textEditingController: loginTextFieldEditingController,
          textInputAction: TextInputAction.next,
          focusNode: onDemandValidationLoginFocusNode,
        ),
        SizedBox(height: theme.spacings.spacing8),
        DesignTextField(
            placeholderText: 'Password',
            status: passwordTextFieldStatus,
            textEditingController: passwordTextFieldEditingController,
            suffixType: DesignTextFieldSuffixType.obscure,
            obscureText: true,
            focusNode: onDemandValidationPasswordFocusNode),
        SizedBox(height: theme.spacings.spacing8),
        TextButton(
            onPressed: () {
              validate();
            },
            child: const Text('Validate!'))
      ],
    );
  }

  void validate() {
    validateLogin();
    validatePassword();
  }

  void validateLogin() {
    if (loginTextFieldEditingController.text.length > 7) {
      setState(() {
        loginTextFieldStatus = DesignTextFieldStatus(
            statusType: DesignTextFieldStatusType.success,
            statusText: 'Validation Success!');
      });
    } else {
      setState(() {
        loginTextFieldStatus = DesignTextFieldStatus(
            statusType: DesignTextFieldStatusType.error,
            statusText: 'Login must be longer than 7 characters');
      });
    }
  }

  void validatePassword() {
    if (passwordTextFieldEditingController.text.length > 6) {
      setState(() {
        passwordTextFieldStatus = DesignTextFieldStatus(
            statusType: DesignTextFieldStatusType.success,
            statusText: 'Validation Success!');
      });
    } else {
      setState(() {
        passwordTextFieldStatus = DesignTextFieldStatus(
            statusType: DesignTextFieldStatusType.error,
            statusText: 'Password must be longer than 6 characters');
      });
    }
  }

  final statusesTypesActiveFocusNode = FocusNode();
  final statusesTypesActiveTextEditingController = TextEditingController();
  final statusesTypesErrorFocusNode = FocusNode();
  final statusesTypesErrorTextEditingController = TextEditingController();
  final statusesTypesWarningFocusNode = FocusNode();
  final statusesTypesWarningTextEditingController = TextEditingController();
  final statusesTypesSuccessFocusNode = FocusNode();
  final statusesTypesSuccessTextEditingController = TextEditingController();
  final statusesTypesCheckingFocusNode = FocusNode();
  final statusesTypesCheckingTextEditingController = TextEditingController();
  Widget statusesTypes() {
    return Column(
      children: [
        Text(
          'Statuses Types',
          style: theme.textStyles.heading3_500,
        ),
        SizedBox(height: theme.spacings.spacing8),
        DesignTextField(
            placeholderText: 'Active',
            status: DesignTextFieldStatus(
              statusType: DesignTextFieldStatusType.active,
            ),
            textEditingController: statusesTypesActiveTextEditingController,
            textInputAction: TextInputAction.next,
            focusNode: statusesTypesActiveFocusNode),
        SizedBox(height: theme.spacings.spacing8),
        DesignTextField(
            placeholderText: 'Error',
            status: DesignTextFieldStatus(
                statusType: DesignTextFieldStatusType.error,
                statusText: "Error"),
            textEditingController: statusesTypesErrorTextEditingController,
            textInputAction: TextInputAction.next,
            focusNode: statusesTypesErrorFocusNode),
        SizedBox(height: theme.spacings.spacing8),
        DesignTextField(
            placeholderText: 'Warning',
            status: DesignTextFieldStatus(
                statusType: DesignTextFieldStatusType.warning,
                statusText: "Warning"),
            textEditingController: statusesTypesWarningTextEditingController,
            textInputAction: TextInputAction.next,
            focusNode: statusesTypesWarningFocusNode),
        SizedBox(height: theme.spacings.spacing8),
        DesignTextField(
            placeholderText: 'Success',
            status: DesignTextFieldStatus(
                statusType: DesignTextFieldStatusType.success,
                statusText: "Success"),
            textEditingController: statusesTypesSuccessTextEditingController,
            textInputAction: TextInputAction.next,
            focusNode: statusesTypesSuccessFocusNode),
        SizedBox(height: theme.spacings.spacing8),
        DesignTextField(
            placeholderText: 'Checking',
            status: DesignTextFieldStatus(
                statusType: DesignTextFieldStatusType.checking,
                statusText: "Checking..."),
            textEditingController: statusesTypesCheckingTextEditingController,
            focusNode: statusesTypesCheckingFocusNode),
        SizedBox(height: theme.spacings.spacing8),
        DesignTextField(
            placeholderText: 'Disabled',
            status: DesignTextFieldStatus(
                statusType: DesignTextFieldStatusType.disabled),
            textEditingController: TextEditingController(),
            focusNode: FocusNode()),
        SizedBox(height: theme.spacings.spacing8),
        DesignTextField(
          placeholderText: 'Read Only',
          status: DesignTextFieldStatus(
              statusType: DesignTextFieldStatusType.readOnly),
          textEditingController: TextEditingController(),
          focusNode: FocusNode(),
        ),
        SizedBox(height: theme.spacings.spacing8),
        Text(
          'Date Time Pickers',
          style: theme.textStyles.heading3_500,
        ),
        SizedBox(height: theme.spacings.spacing8),
        DesignDatePickerTextField(
          placeholderText: 'Date Picker',
          status: DesignTextFieldStatus(
              statusType: DesignTextFieldStatusType.active),
          textEditingController: TextEditingController(),
          onDatePicked: (DateTime pickedDate) {},
        ),
        SizedBox(height: theme.spacings.spacing8),
        DesignTimePickerTextField(
          placeholderText: 'Time Picker',
          status: DesignTextFieldStatus(
              statusType: DesignTextFieldStatusType.active),
          textEditingController: TextEditingController(),
          onTimePicked: (TimeOfDay pickedTime) {},
        ),
        SizedBox(height: theme.spacings.spacing16),
        Text(
          'Multiple Selectors',
          style: theme.textStyles.heading3_500,
        ),
        SizedBox(height: theme.spacings.spacing8),
        DesignMultiSelectorDialogTextField(
          placeholderText: "Multi selecter Dialog",
          searchable: true,
          items: [
            MultiSelectItem("A", "A"),
            MultiSelectItem("B", "B"),
            MultiSelectItem("C", "C")
          ],
          isDismissible: true,
          onConfirm: (p0) {},
        ),
        SizedBox(height: theme.spacings.spacing8),
        DesignMultiSelectorBottomSheetTextField<DemoClass>(
          placeholderText: "Multi selecter bottom sheet",
          searchable: true,
          items: [
            MultiSelectItem(DemoClass("AAAA"), "AAAA"),
            MultiSelectItem(DemoClass("BBBB"), "BBBB"),
            MultiSelectItem(DemoClass("CCCC"), "CCCC")
          ],
          isDismissible: true,
          onConfirm: (p0) {},
          initialValue: [],
        ),
        SizedBox(height: theme.spacings.spacing16),
        Text(
          'Pickers',
          style: theme.textStyles.heading3_500,
        ),
        SizedBox(height: theme.spacings.spacing8),
        DesignSingleColumnPickerTextField<DemoClass>(
          placeholderText: 'Single Column Picker',
          data: [DemoClass("M"), DemoClass("N"), DemoClass("O")],
          textEditingController: TextEditingController(),
          selectData: DemoClass("N"),
          buildTitle: (data, position) {
            return data.title;
          },
          onCancel: (isCancel) {
            print(isCancel);
          },
          onConfirm: (data, position) {
            print(data.title);
          },
          onChanged: (data, position) {
            print(data.title);
          },
        ),
        SizedBox(height: theme.spacings.spacing8),
        DesignMultiColumnPickerTextField(
          placeholderText: 'Multiple Column Picker',
          data: const [
            ["M", "N", "O"],
            ["R", "S", "T"],
            ["A", "B", "C"],
          ],
          suffix: ["", " A", " B"],
          selectData: ["N", "T", "C"],
          onCancel: (isCancel) {
            print(isCancel);
          },
          onConfirm: (data, position) {
            print(data);
          },
          onChanged: (data, position) {
            print(data);
          },
        ),
      ],
    );
  }

  final suffixesObscureFocusNode = FocusNode();
  final suffixesRemoveTextFocusNode = FocusNode();
  final suffixesDropDownFocusNode = FocusNode();
  final suffixesObscureTextEditingController = TextEditingController();
  final suffixesRemoveTextTextEditingController = TextEditingController();
  final suffixesDropDownTextEditingController = TextEditingController();
  Widget suffixes() {
    return Column(
      children: [
        Text(
          'Suffixes',
          style: theme.textStyles.heading3_500,
        ),
        SizedBox(height: theme.spacings.spacing8),
        DesignTextField(
          placeholderText: 'Obscure',
          status: DesignTextFieldStatus(
              statusType: DesignTextFieldStatusType.active),
          textEditingController: suffixesObscureTextEditingController,
          textInputAction: TextInputAction.next,
          suffixType: DesignTextFieldSuffixType.obscure,
          focusNode: suffixesObscureFocusNode,
          obscureText: true,
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(suffixesRemoveTextFocusNode);
          },
        ),
        SizedBox(height: theme.spacings.spacing8),
        DesignTextField(
            placeholderText: 'Remove Text',
            status: DesignTextFieldStatus(
                statusType: DesignTextFieldStatusType.active),
            textEditingController: suffixesRemoveTextTextEditingController,
            textInputAction: TextInputAction.next,
            suffixType: DesignTextFieldSuffixType.removeText,
            focusNode: suffixesRemoveTextFocusNode,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(suffixesDropDownFocusNode);
            }),
        SizedBox(height: theme.spacings.spacing8),
        DesignTextField(
            placeholderText: 'Drop Down',
            status: DesignTextFieldStatus(
                statusType: DesignTextFieldStatusType.active),
            textEditingController: suffixesDropDownTextEditingController,
            textInputAction: TextInputAction.done,
            suffixType: DesignTextFieldSuffixType.dropDown,
            focusNode: suffixesDropDownFocusNode),
      ],
    );
  }

  final activeValidationLoginTextFieldEditingController =
      TextEditingController();
  var activeValidationLoginTextFieldStatus =
      DesignTextFieldStatus(statusType: DesignTextFieldStatusType.active);
  final activeValidationPasswordTextFieldEditingController =
      TextEditingController();
  var activeValidationPasswordTextFieldStatus =
      DesignTextFieldStatus(statusType: DesignTextFieldStatusType.active);

  @override
  void initState() {
    super.initState();
    activeValidationLoginTextFieldEditingController
        .addListener(activeValidationValidateLogin);
    activeValidationPasswordTextFieldEditingController
        .addListener(activeValidationValidatePassword);
  }

  @override
  void dispose() {
    activeValidationLoginTextFieldEditingController.dispose();
    activeValidationPasswordTextFieldEditingController.dispose();
    super.dispose();
  }

  final loginFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  Widget activeValidation() {
    return Column(
      children: [
        Text(
          'Active Validation',
          style: theme.textStyles.heading3_500,
        ),
        DesignTextField(
            placeholderText: 'Login',
            status: activeValidationLoginTextFieldStatus,
            textEditingController:
                activeValidationLoginTextFieldEditingController,
            textInputAction: TextInputAction.next,
            focusNode: loginFocusNode),
        SizedBox(height: theme.spacings.spacing8),
        DesignTextField(
          placeholderText: 'Password',
          status: activeValidationPasswordTextFieldStatus,
          textEditingController:
              activeValidationPasswordTextFieldEditingController,
          suffixType: DesignTextFieldSuffixType.obscure,
          obscureText: true,
          focusNode: passwordFocusNode,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }

  void activeValidationValidateLogin() {
    if (activeValidationLoginTextFieldEditingController.text.length > 7) {
      setState(() {
        activeValidationLoginTextFieldStatus = DesignTextFieldStatus(
            statusType: DesignTextFieldStatusType.success,
            statusText: 'Validation Success!');
      });
    } else if (activeValidationLoginTextFieldEditingController
        .text.isNotEmpty) {
      setState(() {
        activeValidationLoginTextFieldStatus = DesignTextFieldStatus(
            statusType: DesignTextFieldStatusType.error,
            statusText: 'Login must be longer than 7 characters');
      });
    }
  }

  void activeValidationValidatePassword() {
    if (activeValidationPasswordTextFieldEditingController.text.length > 6) {
      setState(() {
        activeValidationPasswordTextFieldStatus = DesignTextFieldStatus(
            statusType: DesignTextFieldStatusType.success,
            statusText: 'Validation Success!');
      });
    } else if (activeValidationPasswordTextFieldEditingController
        .text.isNotEmpty) {
      setState(() {
        activeValidationPasswordTextFieldStatus = DesignTextFieldStatus(
            statusType: DesignTextFieldStatusType.error,
            statusText: 'Password must be longer than 6 characters');
      });
    }
  }

  final multipleLinesMainTextFocusNode = FocusNode();
  final multipleLinesMainTextTextEditingController = TextEditingController();
  Widget multipleLinesMainText() {
    return Column(
      children: [
        Text(
          'Multiple Lines Main Text',
          style: theme.textStyles.heading3_500,
        ),
        SizedBox(height: theme.spacings.spacing8),
        DesignTextField(
            placeholderText: 'Type in multiple lines',
            status: DesignTextFieldStatus(
                statusType: DesignTextFieldStatusType.active),
            textEditingController: multipleLinesMainTextTextEditingController,
            textInputAction: TextInputAction.newline,
            maxLines: null,
            focusNode: multipleLinesMainTextFocusNode)
      ],
    );
  }

  final multipleLinesBottomBarFocusNode = FocusNode();
  final multipleLinesBottomBarTextEditingController = TextEditingController();
  Widget multipleLinesBottomBar() {
    const String text =
        'Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error Error';
    return Column(
      children: [
        Text(
          'Multiple Lines Bottom Bar',
          style: theme.textStyles.heading3_500,
        ),
        SizedBox(height: theme.spacings.spacing8),
        DesignTextField(
            placeholderText: 'Multiple Lines Bottom Bar',
            status: DesignTextFieldStatus(
                statusType: DesignTextFieldStatusType.error, statusText: text),
            textEditingController: multipleLinesBottomBarTextEditingController,
            focusNode: multipleLinesBottomBarFocusNode)
      ],
    );
  }

  final prefixesFocusNode = FocusNode();
  final prefixesTextEditingController = TextEditingController();
  Widget prefixes() {
    return Column(
      children: [
        Text(
          'Prefixes',
          style: theme.textStyles.heading3_500,
        ),
        SizedBox(height: theme.spacings.spacing8),
        DesignTextField(
            placeholderText: 'Prefixes',
            status: DesignTextFieldStatus(
                statusType: DesignTextFieldStatusType.active),
            textEditingController: prefixesTextEditingController,
            prefixIconData: Icons.access_alarms,
            focusNode: prefixesFocusNode)
      ],
    );
  }
}

class DemoClass {
  final String title;
  DemoClass(this.title);
}
