'--------------------------------------------------------------------------------------
'
'	Excel �V�[�g���ɕۑ�
'			(�w�肵��Excel�t�@�C�����P�V�[�g���ɂP�u�b�N�ɕ������܂�)
'	
'	���ӓ_	�X�N���v�g���s�O�ɂ��ׂĂ�Excel�A�v���P�[�V�������I�����Ă��������B
'			�X�N���v�g���s���̓}�E�X�A�L�[�{�[�h���g�p���Ȃ��ł��������B
'			���̃X�N���v�g���ُ�I�������ꍇ��Excel�̃v���Z�X���蓮�ŏI�����Ă��������B
'
'--------------------------------------------------------------------------------------
'�������Ώ�Excel
Const SAVE_ELS = "C:\Documents and Settings\admin\�f�X�N�g�b�v\hoge.xls"

'���ۑ���t�H���_
Const SAVE_DIR = "C:\Documents and Settings\admin\�f�X�N�g�b�v\OUTFOLDER\"

	'Excel���J��
	Set Excel  = CreateObject("Excel.Application")
    Set wkBook = Excel.WorkBooks.Open(SAVE_ELS)
	
	'�V�[�g�̐����[�v
	For i = 1 To wkBook.Sheets.Count

		'�V�[�g�I�u�W�F�N�g���擾
		Set wkSheet = wkBook.Sheets(i)

		'�V�����u�b�N���쐬���A�R�s�[
		Set Addbook = Excel.WorkBooks.Add
		wkSheet.Copy ,Addbook.Sheets(Addbook.Sheets.Count)
		
		'�s�v�ȃV�[�g���폜
	    Excel.DisplayAlerts = False
	    Addbook.Sheets(1).Delete
	    Excel.DisplayAlerts = True

		'���O��t���ĕۑ�
		Addbook.SaveAs SAVE_DIR & wkSheet.Name & ".xls"
		
		Set wkSheet = Nothing
		Addbook.Close
		Set Addbook = Nothing
	Next

	wkBook.Close False
	Set wkBook = Nothing
	Set Excel = Nothing

	msgbox "�o�͂��������܂����B"
