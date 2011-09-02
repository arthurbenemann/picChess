unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mmSystem, WaveUtils, WaveStorage, StdCtrls, WaveIO, WaveOut,
  WavePlayers, ComCtrls, Buttons, FileCtrl, CPort, ExtCtrls;

type
  TMainForm = class(TForm)
    StartPosLabel: TLabel;
    btnPlay: TBitBtn;
    btnPause: TBitBtn;
    btnStop: TBitBtn;
    Progress: TProgressBar;
    StockAudioPlayer: TStockAudioPlayer;
    btnSelectFile: TButton;
    WaveFileName: TEdit;
    AudioFormatLabel: TLabel;
    EndPosLabel: TLabel;
    OpenDialog: TOpenDialog;
    FileListBox1: TFileListBox;
    Generate: TButton;
    ComPort1: TComPort;
    btnBurn: TButton;
    btnRead: TButton;
    btnConfig: TButton;
    btnClose: TButton;
    btnOpen: TButton;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    procedure btnSelectFileClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure StockAudioPlayerActivate(Sender: TObject);
    procedure StockAudioPlayerDeactivate(Sender: TObject);
    procedure StockAudioPlayerLevel(Sender: TObject; Level: Integer);
    procedure WaveFileNameChange(Sender: TObject);
    procedure GenerateClick(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
    procedure btnOpenClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure ComPort1AfterOpen(Sender: TObject);
    procedure ComPort1AfterClose(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnBurnClick(Sender: TObject);
  end;

Const
  FLASH_SIZE = 2097152;
  WRITE_BLOCK = 4096;
  sReceive =2;
  sWrite   =1;
  sDefault =0;

var
  MainForm: TMainForm;
  received,written : Integer;
  data:AnsiString;

  SerialState : Integer;
    binFile   : File;

implementation

{$R *.dfm}

function retriveFilename(str:string):string;
begin
  Result := StringReplace(str, '.wav', '',
                          [rfReplaceAll, rfIgnoreCase]);
end;

procedure TMainForm.btnSelectFileClick(Sender: TObject);
var
  WaveFile: TWaveFile;
  Buffer: array [0 .. 1023] of Byte;
  i: Integer;
begin
  if OpenDialog.Execute then
  begin
    FileListBox1.ApplyFilePath(OpenDialog.FileName);
  end;
end;

procedure TMainForm.btnPlayClick(Sender: TObject);
begin
  StockAudioPlayer.PlayFile(WaveFileName.Text);
end;

procedure TMainForm.btnPauseClick(Sender: TObject);
begin
  StockAudioPlayer.Paused := not StockAudioPlayer.Paused;
end;

procedure TMainForm.btnStopClick(Sender: TObject);
begin
  StockAudioPlayer.Stop;
end;

procedure TMainForm.btnReadClick(Sender: TObject);
begin
  received := 0;
  data:='';
  ProgressBar1.Position:=0;
  ProgressBar1.Max:=FLASH_SIZE;
  SerialState:= sReceive;
  ComPort1.WriteStr('r');
end;

procedure TMainForm.btnConfigClick(Sender: TObject);
begin
  ComPort1.ShowSetupDialog;
end;

procedure TMainForm.btnBurnClick(Sender: TObject);
begin
  written := 0;
  ProgressBar1.Position:=0;
  ProgressBar1.Max:=FLASH_SIZE;
  SerialState:= sWrite;
  AssignFile(binFile, 'sound.hex');
  FileMode := fmOpenRead;
  Reset(binFile, 1);   // Now we define one record as 1 byte
  ComPort1.WriteStr('w');
end;

procedure TMainForm.btnCloseClick(Sender: TObject);
begin
ComPort1.Close;
end;

procedure TMainForm.btnOpenClick(Sender: TObject);
begin
  ComPort1.Open;
end;

procedure TMainForm.ComPort1AfterClose(Sender: TObject);
begin
   btnOpen.Enabled:=True;
   btnConfig.Enabled:=True;
   btnClose.Enabled:=False;
   btnBurn.Enabled:=False;
   btnRead.Enabled:=False;
end;

procedure TMainForm.ComPort1AfterOpen(Sender: TObject);
begin
   btnOpen.Enabled:=False;
   btnConfig.Enabled:=False;
   btnClose.Enabled:=True;
   btnBurn.Enabled:=True;
   btnRead.Enabled:=True;
end;

procedure TMainForm.ComPort1RxChar(Sender: TObject; Count: Integer);
var
  Str: String;
  myFile : TextFile;
  oneByte   : byte;
  i : Integer;
begin
  ComPort1.ReadStr(Str, Count);
  case SerialState of
    sDefault: begin

             end;

    sReceive: begin
                  data:=data+Str;
                  inc(received,Count);
                  ProgressBar1.Position := received;
                  Label1.Caption:=IntToStr(received);
                  Repaint;
                  if(received=FLASH_SIZE) then
                   begin
                   // Try to open the Test.txt file for writing to
                   AssignFile(myFile, 'soundRead.hex');
                   ReWrite(myFile);
                   Write(myFile,data);
                   // Close the file
                   CloseFile(myFile);
                   SerialState := sDefault;
                   ShowMessage('Dump Ended');
                   end;
                  end;

    sWrite:   begin
              for i:=0 to WRITE_BLOCK - 1 do
              begin
                BlockRead(binFile, oneByte, 1);   // Read one byte at a time
                ComPort1.Write(oneByte,1);
              end;

              Inc(written,WRITE_BLOCK);
              Label1.Caption:=IntToStr(written);
              ProgressBar1.Position := written;
              Refresh;

              if written>=FLASH_SIZE then
              begin
                CloseFile(binFile);
                SerialState:=sDefault;
                ShowMessage('Chip Burned');
              end;
             end;
  end;
end;

procedure TMainForm.FileListBox1DblClick(Sender: TObject);
begin
  btnPlayClick(self);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ComPort1.Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SerialState:=sDefault;
  ComPort1.BaudRate:=brCustom;
  ComPort1.CustomBaudRate:=256000;
end;

procedure TMainForm.GenerateClick(Sender: TObject);
var
  i, size, addCnt: Integer;
  WaveFile: TWaveFile;
  myFile    : File;
  Buffer: array[0 .. 1000000] of Byte;
  empty: array[0 .. 31] of Byte;
  filename:string;
  filesize:Integer;
  c:AnsiChar;
  AddresArray,lengthArray:string;
  header:TStringList;
  begin

  header:= TStringList.Create;

  if (StockAudioPlayer.Active) then
    btnStopClick(self);


  filesize:=0;
  // Try to open the Test.byt file for writing to
  AssignFile(myFile, 'sound.hex');
  ReWrite(myFile, 32);   // Define a single 'record' as 32 bytes

  //handle memo
  header.Clear;
  header.Add('//----------------------------------------------------------');
  header.Add('//'+#9+#9+'sounds.h');
  header.Add('//'+#9+' waveBurner Header');
  header.Add('//'+#9+' Arthur Benemann   '+DateTimeToStr(Now()));
  header.Add('//----------------------------------------------------------');
  header.Add('//');
  header.Add('//'+#9+'Description:');
  header.Add('// This is the header for the hex that contains the sound');
  header.Add('// The address of each sound in the hex file is listed here');
  header.Add('//');
  header.Add('//----------------------------------------------------------');
  header.Add('');
  header.Add('#define NUM_SOUNDS'+#9+IntToStr(FileListBox1.Items.Count));
  header.Add('');
  header.Add('//----------------------- Sounds ---------------------------');

  AddresArray:='const long soundAdd[] = {';
  lengthArray:='const unsigned int soundLengths[] = {';

  AddCnt := 0;
  for i := 0 to (FileListBox1.Items.Count - 1) do
  begin
    WaveFileName.Text := FileListBox1.Items[i];
    filename:=FileListBox1.Items[i];
    WaveFile := TWaveFile.Create(WaveFileName.Text,
      fmOpenRead or fmShareDenyWrite);
    try
      if (not(WaveFile.AudioFormat = 'PCM: 8,000 kHz, 16 Bit, Mono')) then
      begin
        ShowMessage('Some files are not formated as PCM: 8,000 kHz, 16 Bit, Mono');
      end
      else
      begin
        // Begin processing this file
        WaveFile.BeginRead;
        size :=  WaveFile.Read(Buffer, WaveFile.DataSize);
        if(not(size = WaveFile.DataSize)) then
          ShowMessage('Buffer is not large enought');
        WaveFile.EndRead;

        // Add padding to be in a 32 byte block
        while not((size mod 32)=0) do
        begin
            Buffer[size] := 0;
            Inc(size);
        end;

        // Write the data array to the file
        BlockWrite(myFile, Buffer, size div 32);   // Write in block of 32 bytes
        Inc(filesize, size);

        // handle the header
        header.Add('#define'+#9+'S_'+UpperCase(retriveFilename(filename))+
        #9+'0x'+IntToHex(i,2)+#9+'//'+IntToStr(size div 1024)+' Kbytes');

        AddresArray:=AddresArray+'0x'+IntToHex(addCnt,8)+',';
        lengthArray:=lengthArray+'0x'+IntToHex(size div 64,8)+',';

        Inc(addCnt,size);


      end;
    finally
      WaveFile.Free;
    end;
  end;

  header.Add('');
  header.Add('');

  header.Add('extern const long soundAdd[];');
  header.Add('extern const unsigned int soundLengths[] ;');


  for i := 0 to 31 do
    empty[i]:= 255;

  while(filesize<FLASH_SIZE) do begin
    BlockWrite(myFile, empty, 1);
    Inc(filesize,32);
  end;

  // Close the file
  CloseFile(myFile);


  // Save the header in a file
  header.SaveToFile('sounds.h');

  //handle sounds.c
  header.Clear;
  header.Add('//----------------------------------------------------------');
  header.Add('//'+#9+#9+'sounds.c');
  header.Add('//'+#9+' waveBurner Header');
  header.Add('//'+#9+' Arthur Benemann   '+DateTimeToStr(Now()));
  header.Add('//----------------------------------------------------------');
  header.Add('//');
  header.Add('//'+#9+'Description:');
  header.Add('// Contains the inicialization of the addres and length arrays');
  header.Add('//');
  header.Add('//----------------------------------------------------------');
  header.Add(Copy(AddresArray,0,length(AddresArray)-1)+'};');
  header.Add(Copy(lengthArray,0,length(lengthArray)-1)+'};');
  // Save the header in a file
  header.SaveToFile('sounds.c');

  header.Free;

end;

procedure TMainForm.StockAudioPlayerActivate(Sender: TObject);
begin
  btnPause.Enabled := True;
  btnStop.Enabled := True;
  btnPlay.Enabled := False;
end;

procedure TMainForm.StockAudioPlayerDeactivate(Sender: TObject);
begin
  btnPlay.Enabled := True;
  btnPause.Enabled := False;
  btnStop.Enabled := False;
end;

procedure TMainForm.StockAudioPlayerLevel(Sender: TObject; Level: Integer);
begin
  Progress.Position := StockAudioPlayer.Position;
end;

procedure TMainForm.WaveFileNameChange(Sender: TObject);
var
  WaveFile: TWaveFile;
  Buffer: array [0 .. 1023] of Byte;
begin
  if (not(AnsiPos('.wav', WaveFileName.Text) = 0)) then
  begin
    if (StockAudioPlayer.Active) then
      btnStopClick(self);
    WaveFileName.Text := WaveFileName.Text;
    WaveFile := TWaveFile.Create(WaveFileName.Text,
      fmOpenRead or fmShareDenyWrite);
    try
      begin
        AudioFormatLabel.Caption := WaveFile.AudioFormat;
        Progress.Position := 0;
        Progress.Max := WaveFile.Length;
        EndPosLabel.Caption := MS2Str(WaveFile.Length, msSh) + ' s';
      end
    finally
      WaveFile.Free;
    end;
    btnPlay.Enabled := True;
  end;
end;

end.
