'--------------------------------------------------------------------------------------
'
'	Excel �P�u�b�N�ɂ܂Ƃ߂�
'			(�w�肵���t�H���_�ɂ���Excel��1�u�b�N�ɕ������܂�)
'	
'	���ӓ_	�X�N���v�g���s�O�ɂ��ׂĂ�Excel�A�v���P�[�V�������I�����Ă��������B
'		�X�N���v�g���s���̓}�E�X�A�L�[�{�[�h���g�p���Ȃ��ł��������B
'		���̃X�N���v�g���ُ�I�������ꍇ��Excel�̃v���Z�X���蓮�ŏI�����Ă��������B
'
'--------------------------------------------------------------------------------------
'���}�[�W�Ώۃt�H���_
Const SAVE_ELS = "C:\Users\harada\Desktop\�G�r�f���X\�G�r�f���X"

'���ۑ���t�H���_
Const SAVE_DIR = "C:\output\"

'���ۑ���t�@�C����
Const SAVE_FILE ="test" 



	'���̃f�B���N�g���̃t�@�C���ꗗ���擾����
	Set fileSystem   = CreateObject("Scripting.FileSystemObject")
	Set targetFolder = fileSystem.getFolder(SAVE_ELS)
	Set fileList = targetFolder.Files

	'Excel�I�u�W�F�N�g���J��
	Set Excel  = CreateObject("Excel.Application")
	Excel.DisplayAlerts = False

	'�V�����u�b�N���쐬���A�R�s�[
	Set Addbook = Excel.WorkBooks.Add

	'�t�@�C���̏I�[�܂Ń��[�v
	For Each wkFile In fileList


        	Set wkBook = Excel.WorkBooks.Open(SAVE_ELS & "\" & wkFile.Name)

		'�V�[�g�̐����[�v
		For i = 1 To wkBook.Sheets.Count

			'�V�[�g�I�u�W�F�N�g���擾
			Set wkSheet = wkBook.Sheets(i)

			wkSheet.Copy ,Addbook.Sheets(Addbook.Sheets.Count)
	
		
			Set wkSheet = Nothing

		Next

		wkBook.Close	
		Set wkBook = Nothing
	Next


	'���O��t���ĕۑ�
	Addbook.SaveAs SAVE_DIR & SAVE_FILE  & ".xlsx"

	Addbook.Close
	Set Addbook = Nothing

	Set wkBook = Nothing
	Set Excel = Nothing

	msgbox "�o�͂��������܂����B"