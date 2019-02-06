unit XPAdAutoUpdateMessages;

interface

type
TTypeMessage = (tmInformation, tmWarning, tmError);

const
  NErro_Generic_FileNotFound            = 1;
  NErro_Generic_DirectoryNotFound       = 2;

  NErro_Descriptor_FileNotFound         = 11;
  NErro_Descriptor_DirectoryNotFound    = 12;
  NErro_Descriptor_FileEmpty            = 13;
  NErro_Descriptor_FileBroken           = 14;
  NErro_Descriptor_DirDownloadNotSet    = 15;
  NErro_Descriptor_DirDownloadNotFound  = 16;

  NErro_Package_FileNotFound            = 21;
  NErro_Package_BuildDirectoryNotFound  = 22;
  NErro_Package_VersionMissing          = 23;
  NErro_Package_VersionWrongFormat      = 24;
  NErro_Package_Empty                   = 25;
  NErro_Package_BuildDirectoryNotSet    = 26;
  NErro_Package_Broken                  = 27;

  NErro_CFG_ServerNotFound              = 31;
  NErro_CFG_PortMissing                 = 32;
  NErro_CFG_UserMissing                 = 33;
  NErro_CFG_PassMissing                 = 34;
  NErro_CFG_RemoteDirectoryNotFound     = 35;

  NErro_Compress_Fail                   = 41;
  NErro_Decompress_Fail                 = 51;
  NErro_Upload_Fail                     = 61;
  NErro_Download_Fail                   = 62;
  NErro_ValidateFail                    = 71;
  NErro_Publish_Fail                    = 81;
  NErro_Upgrade_Fail                    = 91;
  NErro_Delete_Fail                     = 101;
  NErro_BuildDescriptor_Fail            = 111;
  NErro_Upgrade_Cancel                  = 121;

resourcestring
  MErro_Generic_FileNotFound            = 'Arquivo n�o encontrado.';
  MErro_Generic_DirectoryNotFound       = 'Diretorio n�o encontrado.';

  MErro_Descriptor_FileNotFound         = 'Descriptor n�o encontrado.';
  MErro_Descriptor_DirectoryNotFound    = 'Diret�rio n�o encontrado.';
  MErro_Descriptor_DirDownloadNotSet    = 'Diret�rio de Download nao informado.';
  MErro_Descriptor_DirDownloadNotFound  = 'Diretporio de Download n�o encontrado.';

  MErro_Package_FileNotFound            = 'Pacote n�o encontrado.';
  MErro_Package_BuildDirectoryNotFound  = 'Diretorio de constru��o n�o encontrado.';
  MErro_Package_VersionMissing          = 'Vers�o do pacote n�o informada.';
  MErro_Package_VersionWrongFormat      = 'Vers�o do pacote inv�lida.';
  MErro_Package_Empty                   = 'Pacote vazio.';
  MErro_Package_BuildDirectoryNotSet    = 'Diretorio de construcao n�o informado.';
  MErro_Package_Broken                  = 'Pacote quebrado.';

  MErro_CFG_ServerNotFound              = 'Servidor n�o encontrado.';
  MErro_CFG_PortMissing                 = 'Porta n�o encontrada.';
  MErro_CFG_UserMissing                 = 'Usu�rio n�o informado.';
  MErro_CFG_PassMissing                 = 'Senha n�o informada.';
  MErro_CFG_RemoteDirectoryNotFound     = 'Diret�rio Remoto n�o encontrado.';

  MErro_Compress_Fail                   = 'Falha na compress�o do arquivo (%s).';
  MErro_Decompress_Fail                 = 'Falha na descompress�o do arquivo (%s).';
  MErro_Upload_Fail                     = 'Falha no envio do arquivo (%s).';
  MErro_Download_Fail                   = 'Falha no recebimento do arquivo (%s).';
  MErro_ValidateFail                    = 'Falha na integridade do arquivo (%s).';
  MErro_Publish_Fail                    = 'Falha na publica��o do pacote (%s).';
  MErro_Upgrade_Fail                    = 'Falha na atualiza��o do aplicativo.';
  MErro_Delete_Fail                     = 'Falha ao tentar excluir arquivo (%s)';
  MErro_BuildDescriptor_Fail            = 'Falha ao tentar carregar o descritor';
  MErro_Upgrade_Cancel                  = 'Atualiza��o cancelada pelo usu�rio.';
  MErro_Search                          = 'Falha ao buscar atualiza��o.';

  MInf_Complete                         = 'Sistema atualizado com sucesso!';
  MInf_Updated                          = 'O sistema est� na ultima vers�o!';
  MInf_NewUpdate                        = 'Uma nova atualiza��o foi encontrada, deseja atualizar ?';

  {Validation}
  MValid_DirNotFound                    = 'Diretorio do Executavel n�o informado!';
  MValid_AppNameNotFound                = 'Nome da aplica��o n�o informada!';

procedure MessageXPAd(AMessage: String; ATypeMessage: TTypeMessage = tmInformation);
function QuestionYesNo(cMensg: String; Afocus: Boolean = False): Boolean;

implementation

uses
  Vcl.Forms, Winapi.Windows, XPAdMethods;

procedure MessageXPAd(AMessage: String; ATypeMessage: TTypeMessage = tmInformation);
begin
  case ATypeMessage of
    tmError     :  Application.MessageBox(PWideChar(AMessage), 'Erro'      , MB_OK + MB_ICONERROR       + MB_TOPMOST);
    tmWarning   :  Application.MessageBox(PWideChar(AMessage), 'Aten��o'   , MB_OK + MB_ICONWARNING     + MB_TOPMOST);
    tmInformation: Application.MessageBox(PWideChar(AMessage), 'Informa��o', MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
  end;
end;


function questionYesNo(cMensg: String; Afocus: Boolean = False): Boolean;
begin
  Result := (Application.MessageBox(PWidechar(cMensg),'Aten��o', MB_YESNO + MB_ICONQUESTION + TUtils.IIF<Integer>(Afocus, MB_DEFBUTTON1, MB_DEFBUTTON2) + MB_TOPMOST) = 6);
end;

end.
